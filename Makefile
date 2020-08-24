### Makefile ---

export GO_BUILD=GO111MODULE=on go build -ldflags "-s" github.com/chengshiwen/influx-stress/cmd/influx-stress
all: build

build:
	$(GO_BUILD)

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GO_BUILD)

test:
	go test -v github.com/chengshiwen/influx-stress/lineprotocol
	go test -v github.com/chengshiwen/influx-stress/point
	go test -v github.com/chengshiwen/influx-stress/write

help:
	go run cmd/influx-stress/main.go help

insert:
	go run cmd/influx-stress/main.go insert -r 10s -f

lint:
	golangci-lint run --enable=golint --disable=errcheck --disable=typecheck
	goimports -l -w .
	go fmt ./...
	go vet ./...

clean:
	rm -rf influx-stress

### Makefile ends here
