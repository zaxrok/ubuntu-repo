# ubuntu-repo

## Build ubuntu-repo image
```sh
docker build -t ubuntu-repo .
```

## Usage
```sh
docker run -e SERVER_URL=privateserver.domain.local -d -p 80:80 -v /opt/packeges/sources/:/mnt/packages/ ubuntu-repo
```

### Include repo on client side 
```sh
echo "deb http://privateserver.domain.local/ trusty main" >> /etc/apt/sources.list.d/privateserver.domain.local.list
```

### TODO
1 - Add option to use a custom gpg key

2 - Add suporte to download packets from other source, like s3 or github
