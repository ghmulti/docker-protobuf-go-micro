

# run script from target directory
sudo docker run --rm -v $PWD:/src:rw -w /src zabey/docker-protobuf-go-micro --go_out=plugins=micro:. *.proto


