module github.com/solarwinds/snap-plugin-lib

go 1.13

require (
	github.com/golang/protobuf v1.5.2
	github.com/josephspurrier/goversioninfo v1.3.0
	github.com/julienschmidt/httprouter v1.3.0
	github.com/securego/gosec/v2 v2.8.1
	github.com/sirupsen/logrus v1.8.0
	github.com/smartystreets/goconvey v1.6.4
	github.com/solarwinds/grpchan v1.1.1 // indirect
	github.com/solarwinds/snap-plugin-lib/v2 v2.0.4 // indirect
	github.com/urfave/cli v1.22.5
	golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/tools v0.1.3
	google.golang.org/genproto v0.0.0-20210302174412-5ede27ff9881 // indirect
	google.golang.org/grpc v1.36.0
	honnef.co/go/tools v0.0.1-2020.1.4
)

// Freeze as in the next commit there was //go:embed added (supported since go 1.16)
replace github.com/google/licenseclassifier => github.com/google/licenseclassifier v0.0.0-20210325184830-bb04aff29e72
