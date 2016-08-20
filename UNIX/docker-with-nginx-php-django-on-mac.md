# Docker with nginx, php and django on Mac OS X

- Download [Docker Toolbox](https://www.docker.com/products/docker-toolbox) and install it.
    - [Install Guide](https://docs.docker.com/mac/step_one/)
    
    ```
    $ docker-machine create --driver virtualbox default
    ...
    $ eval $(docker-machine env default)
    $ docker-machine ls
    NAME     ACTIVE  DRIVER      STATE   URL     SWARM   DOCKER    ERRORS
    default  *       virtualbox  Running tcp://192.168.99.100:2376  v1.11.2
    $ docker run -d -p 8000:80 nginx
    ...
    $ docker ps
    CONTAINER ID  IMAGE  COMMAND  CREATED  STATUS  PORTS  NAMES
    4b0c6c68c4d2  nginx  "nginx -g 'daemon off"   18 seconds ago      Up 13 seconds       443/tcp, 0.0.0.0:8000->80/tcp   cranky_raman
    ```

    - Connect to [http://<DOCKER_HOST>:8000/](http://192.168.99.100:8000/) on your browser.

