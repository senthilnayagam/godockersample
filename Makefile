default: test

setup:
	go get github.com/mailgun/godebug

buildgo:
	CGO_ENABLED=0 GOOS=linux go build -ldflags "-s" -a -installsuffix cgo -o main .

builddocker:
	docker build --rm --tag=senthilnayagam/godockersample .

buildp: buildgo builddocker

run: buildp
	docker run \
		-e HELLO=world \
		-p 1337:1337 senthilnayagam/godockersample

test:
	go test -timeout=5s ./...

debug:
ifndef $(instrument)
	godebug run ${gofiles}
else
	godebug run -instrument=${instrument} ${gofiles}
endif
