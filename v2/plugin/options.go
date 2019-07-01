package plugin

import (
	"time"

	"github.com/sirupsen/logrus"
)

type Options struct {
	GrpcIp            string
	GrpcPort          int
	GrpcPingTimeout   time.Duration
	GrpcPingMaxMissed int

	LogLevel    logrus.Level
	EnablePprof bool
	EnableStats bool
	PprofPort   int
	StatsPort   int

	DebugMode            bool
	PluginConfig         string
	DebugCollectCounts   int
	DebugCollectInterval time.Duration
}