# Note

- `sed -i '5 i\GOARM := $(shell go env GOARM)' Makefile`: add support to specfy arm v7 in env
- `go build buildscripts/gen-ldflags.go`: build before setting env, otherewise this will built for arm but builder/travis runs on x86
- `sed -i 's/^LDFLAGS := .*$/LDFLAGS := $(shell $(PWD)\/gen-ldflags)/' Makefile` add from above
