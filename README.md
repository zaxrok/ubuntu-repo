# ubuntu-repo

## Build ubuntu-repo image
```sh
docker build -t ubuntu-repo .
```

## Usage
```sh
docker run -e SERVER_URL=privateserver.domain.local -d -p 80:80 -v /opt/packeges/sources/:/mnt/packages/ ubuntu-repo
```
