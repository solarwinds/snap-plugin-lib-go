package service

import (
	"context"
	"errors"
	"fmt"
	"time"

	"github.com/librato/snap-plugin-lib-go/v2/pluginrpc"
	"github.com/sirupsen/logrus"
)

const (
	DefaultPingTimeout           = 3 * time.Second
	DefaultMaxMissingPingCounter = 3
)

var (
	logControlService = log.WithField("service", "Control")

	RequestedKillError = errors.New("kill requested")
)

type controlService struct {
	pingCh  chan struct{} // notification about received ping
	closeCh chan<- error  // request exit to main routine
}

func newControlService(closeCh chan error, pingTimeout time.Duration, maxMissingPingCounter uint) *controlService {
	cs := &controlService{
		pingCh:  make(chan struct{}),
		closeCh: closeCh,
	}

	go cs.monitor(pingTimeout, maxMissingPingCounter, closeCh)

	return cs
}

func (cs *controlService) Ping(context.Context, *pluginrpc.PingRequest) (*pluginrpc.PingResponse, error) {
	logControlService.Debug("GRPC Ping() received")

	cs.pingCh <- struct{}{}

	return &pluginrpc.PingResponse{}, nil
}

func (cs *controlService) Kill(context.Context, *pluginrpc.KillRequest) (*pluginrpc.KillResponse, error) {
	logControlService.Debug("GRPC Kill() received")

	cs.closeCh <- RequestedKillError

	return &pluginrpc.KillResponse{}, nil
}

func (cs *controlService) monitor(timeout time.Duration, maxPingMissed uint, closeCh chan error) {
	pingMissed := uint(0)

	// infinitive monitoring (unless unload)
	if timeout == time.Duration(0) || maxPingMissed == 0 {
		for {
			select {
			case <-closeCh:
				return
			case _, ok := <-cs.pingCh:
				if !ok {
					return
				}
			}
		}
	}

	// monitor for max ping missed
	for {
		select {
		case <-cs.pingCh:
			pingMissed = 0
		case <-time.After(timeout):
			pingMissed++
			log.WithFields(logrus.Fields{
				"missed": pingMissed,
				"max":    maxPingMissed,
			}).Warningf("Ping timeout occurred")

			if pingMissed >= maxPingMissed {
				cs.closeCh <- fmt.Errorf("ping message missed %d times (timeout: %s)", maxPingMissed, timeout)
				return
			}
		case <-closeCh:
			return
		}
	}
}
