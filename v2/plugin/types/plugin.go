package types

type Collector interface {
	Collect(ctx Context) error
}

type LoadableCollector interface {
	Load(Context) error
	Unload(Context) error
}

type DefinableCollector interface {
	DefineMetrics(CollectorContext) error
}
