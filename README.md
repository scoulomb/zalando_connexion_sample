# Sample connexion project

[![Build Status](https://travis-ci.org/scoulomb/zalando_connexion_sample.svg?branch=master)](https://travis-ci.org/scoulomb/zalando_connexion_sample)

Initially created to open [Zalando Connexion Issue 1202](https://github.com/zalando/connexion/issues/1202) on `Content-Type` header issue.

Issue also described in curl.sh

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

## Branches 

There are 3 branches in this repository:

- `master`: Initial branch used to open and reproduce issue [Zalando connexion issue #1202](https://github.com/zalando/connexion/issues/1202)

- `buildLocalLib`: Branch made to show how to use [local connexion code](https://github.com/scoulomb/zalando_connexion_sample/compare/master...buildLocalLib?expand=1) rather than official pypy package.
This enable to make non regression test when modifying connexion library. 

I used it specifically to build this connexion branch: https://github.com/scoulomb/connexion/tree/Issue1202
For [PR#1204 here](https://github.com/zalando/connexion/pull/1204) fixing [Zalando connexion issue #1202](https://github.com/zalando/connexion/issues/1202).

More excatly we had made this specific connexion branch for the non reg testing: https://github.com/zalando/connexion/compare/master...scoulomb:issue1202-nonreg?expand=1
This connexion branch is based on v2 version of the code (see historic in PR comment).
I added 3 versions of the code here : https://github.com/scoulomb/connexion/blob/issue1202-nonreg/all-3versions.py (missing v0)

I did not run the non reg of last version as covered by unit test

- `demo`: Branch to make [Connexion demo](https://github.com/scoulomb/zalando_connexion_sample/compare/demo?expand=1)


## Original contributors

- [Jiehong](https://github.com/Jiehong)
- [scoulomb](https://github.com/scoulomb)
