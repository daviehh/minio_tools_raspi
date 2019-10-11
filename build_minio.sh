git clone https://github.com/minio/minio.git

cd minio
latesttag=$(git describe --tags --abbrev=0)
echo checking out ${latesttag}
git checkout ${latesttag}

sed -i '1 i\GOARM := $(shell go env GOARM)' Makefile

env GOOS=linux GOARCH=arm GOARM=7 make