module github.com/solarwinds/snap-plugin-lib

go 1.13

require (
	github.com/golang/protobuf v1.5.2
	github.com/google/go-licenses v0.0.0-00010101000000-000000000000
	github.com/josephspurrier/goversioninfo v1.4.0
	github.com/julienschmidt/httprouter v1.3.0
	github.com/securego/gosec/v2 v2.11.0
	github.com/sirupsen/logrus v1.8.1
	github.com/smartystreets/goconvey v1.7.2
	github.com/spf13/cobra v1.3.0 // indirect
	github.com/urfave/cli v1.22.5
	golang.org/x/lint v0.0.0-20210508222113-6edffad5e616
	golang.org/x/tools v0.1.11-0.20220513221640-090b14e8501f
	google.golang.org/grpc v1.43.0
	honnef.co/go/tools v0.3.2
)

require (
	github.com/BurntSushi/toml v0.4.1 // indirect
	github.com/akavel/rsrc v0.10.2 // indirect
	github.com/cpuguy83/go-md2man/v2 v2.0.1 // indirect
	github.com/emirpasic/gods v1.12.0 // indirect
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b // indirect
	github.com/google/licenseclassifier v0.0.0-20210722185704-3043a050f148 // indirect
	github.com/google/uuid v1.3.0 // indirect
	github.com/gookit/color v1.4.2 // indirect
	github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1 // indirect
	github.com/inconshreveable/mousetrap v1.0.0 // indirect
	github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99 // indirect
	github.com/jtolds/gls v4.20.0+incompatible // indirect
	github.com/kevinburke/ssh_config v0.0.0-20190725054713-01f96b0aa0cd // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/nbutton23/zxcvbn-go v0.0.0-20210217022336-fa2cb2858354 // indirect
	github.com/otiai10/copy v1.6.0 // indirect
	github.com/russross/blackfriday/v2 v2.1.0 // indirect
	github.com/sergi/go-diff v1.2.0 // indirect
	github.com/smartystreets/assertions v1.2.0 // indirect
	github.com/spf13/cobra v1.3.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/src-d/gcfg v1.4.0 // indirect
	github.com/xanzy/ssh-agent v0.2.1 // indirect
	github.com/xo/terminfo v0.0.0-20210125001918-ca9a967f8778 // indirect
	golang.org/x/crypto v0.0.0-20210921155107-089bfa567519 // indirect
	golang.org/x/exp/typeparams v0.0.0-20220218215828-6cf2b201936e // indirect
	golang.org/x/mod v0.6.0-dev.0.20220419223038-86c51ed26bb4 // indirect
	golang.org/x/net v0.0.0-20220114011407-0dd24b26b47d // indirect
	golang.org/x/sys v0.0.0-20220111092808-5a964db01320 // indirect
	golang.org/x/text v0.3.7 // indirect
	google.golang.org/genproto v0.0.0-20220112215332-a9c7c0acf9f2 // indirect
	google.golang.org/protobuf v1.27.1 // indirect
	gopkg.in/src-d/go-billy.v4 v4.3.2 // indirect
	gopkg.in/src-d/go-git.v4 v4.13.1 // indirect
	gopkg.in/warnings.v0 v0.1.2 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
)

replace (
	github.com/google/go-licenses => github.com/google/go-licenses v0.0.0-20211216151313-baa4dc16ea37

	// Freeze as in the next commit there was //go:embed added (supported since go 1.16)
	github.com/google/licenseclassifier => github.com/google/licenseclassifier v0.0.0-20210325184830-bb04aff29e72
	github.com/securego/gosec/v2 => github.com/securego/gosec/v2 v2.9.1
)
