git clone https://github.com/minio/mc.git

cd mc
latesttag=$(git describe --tags --abbrev=0)
echo checking out ${latesttag}
git checkout ${latesttag}

sed -i 's/^GOARCH := .*$/GOARCH := arm/' Makefile
sed -i 's/^GOOS := .*$/GOOS := linux/' Makefile
sed -i '5 i\GOARM := 7' Makefile

make
