package stats

import (
	"time"
)

type Statistics struct {
	pluginInfo   pluginInfoFields
	tasks        tasksFields
	tasksDetails map[int]taskDetailsFields
}

/*****************************************************************************/

type pluginInfoFields struct {
	Name      string
	Version   string
	StartTime time.Time
	Options   string // todo: format?
}

type tasksFields struct {
	CurrentlyActiveTasks uint
	TotalActiveTasks     uint
	TotalCollectsRequest uint

	AvgProcessingTime time.Duration
	MaxProcessingTime time.Duration

	totalProcessingTime uint
}

type taskDetailsFields struct {
	Configuration string
	Filters       []string

	LoadedTime           time.Time
	CollectRequest       uint
	TotalMetrics         uint
	AvgMetricsPerCollect uint

	TotalProcessingTime time.Duration
	AvgProcessingTime   time.Duration
	MaxProcessingTime   time.Duration
}
