### Makefile ---

all: build

build:
	go build github.com/chengshiwen/influx-stress/cmd/influx-stress

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" github.com/chengshiwen/influx-stress/cmd/influx-stress

test:
	go test -v github.com/chengshiwen/influx-stress/lineprotocol
	go test -v github.com/chengshiwen/influx-stress/point
	go test -v github.com/chengshiwen/influx-stress/write

help:
	go run cmd/influx-stress/main.go help

insert:
	go run cmd/influx-stress/main.go insert -r 10s -f

fmt:
	find . -name "*.go" -exec go fmt {} \;

clean:
	rm -rf influx-stress

### Makefile ends here
