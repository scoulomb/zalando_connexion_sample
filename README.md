# Sample connexion project

Initially created to open [Zalando Connexion Issue 1202](https://github.com/zalando/connexion/issues/1202) on `Content-Type` header issue.

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

## Demo

### In real code

- Spec as code rather than confluence (show in scm with online edit):
    - show in local with compose
- Same for swagger 

- Explain it is pushed every time we do a change in the repo and show it

- Added value:
    * version code with specification in the different environment
    * spec in same place as of the code
    * local version (outage, offline work)
    * code review (more powerful than comala workflow)
    * diff highlighted

### In this sample code 

Show how to write an API using connexion with this sample app rather than real code

Show swagger with Pycharm plugin

Show with Postman example
- post activity
- Invalid field/enum (show impact when changing it in OpenApi)
- Invalid path
- required field - to also show
- get activity
- list activites
- get calory count