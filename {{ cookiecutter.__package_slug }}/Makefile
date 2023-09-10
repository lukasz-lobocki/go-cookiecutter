.PHONY: build
.PHONY: release
.PHONY: snapshot
.PHONY: run
.PHONY: clean

build:
	go mod tidy
	goreleaser build --clean

release:
	go mod tidy
	git tag "$(shell svu next)"
	git push --tags
	goreleaser release --clean

snapshot:
	go mod tidy
	goreleaser build --clean --snapshot

run: snapshot
	go run .

clean:
	go clean
