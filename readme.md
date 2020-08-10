### Docker Steps (run while in solution directory)

1) Build Image

docker build -t kyle-morton/docker-web:build .

2) Run image

docker run --rm -it -p 8080:5000 kyle-morton/docker-web:build

3) access API using port 8080 (mapped to port 5000 inside the container)