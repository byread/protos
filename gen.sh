#!/bin/sh
# shellcheck disable=SC2044
for file in $(find . -name "*.proto");
do
  protoc --go_opt=module=github.com/byread/protos  --proto_path=$GOPATH/src  --proto_path=. --micro_out=paths=source_relative:. --go_out=. ${file}
done

for pbfile in $(find . -name "*.pb.go");
do
  protoc-go-inject-tag -input="$pbfile"
done
