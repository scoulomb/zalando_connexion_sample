# Sample connexion project

Initially created to open issue to `Connexion` framework on `Content-Type` header issue.
Issue described in curl.sh

## Run 

Run server and curl showing buggy cases

```
sudo docker-compose up --build
````

To run only the server do:

````
sudo docker-compose up --build server
````

Note the port forwarding.
If use `docker run` add `-p` option.

````
sudo docker build . -f pod.Dockerfile -t server
sudo docker run -p 8080:8080 server
```` 

If using a VM when performing the curl, check also port forwarding rule at VM level

## Original contributors

- [Jiehong](https://github.com/Jiehong)
- [scoulomb](https://github.com/scoulomb)