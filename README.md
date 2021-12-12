
This project is **Work-in-Progress**

# docker-onedrive-webui

## Run

```
docker run --name onedrive -d \
    -p 8080:8080 \
    -v ${PWD}/onedrive_conf:/onedrive/conf \
    -v ${PWD}/OneDrive:/onedrive/data \
    -e ONEDRIVE_UID=`id -u` \
    -e ONEDRIVE_GID=`id -g` \
    tanaga9/onedrive-webui
```

or git clone and docker compose up
```PUID=`id -u` PGID=`id -g` docker-compose up```

## Login

- http://127.0.0.1:8080/jupyter/
    - Read document [Authorize the application with your OneDrive Account](https://github.com/abraunegg/onedrive/blob/master/docs/USAGE.md#authorize-the-application-with-your-onedrive-account)
    - Run [OneDriveLogin.ipynb](OneDriveLogin.ipynb)
- http://127.0.0.1:8080/dashboard
    - Start `onedrive`
