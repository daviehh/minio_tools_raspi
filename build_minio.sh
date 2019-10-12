git clone https://github.com/minio/minio.git

cd minio
latesttag=$(git describe --tags --abbrev=0)
echo checking out ${latesttag}
git checkout ${latesttag}

go build buildscripts/gen-ldflags.go

sed -i '5 i\GOARM := $(shell go env GOARM)' Makefile
sed -i 's/^LDFLAGS := .*$/LDFLAGS := $(shell $(PWD)\/gen-ldflags)/' Makefile

env GOOS=linux GOARCH=arm GOARM=7 make
