set -o xtrace
sleep 5

curl --request POST --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities --data '{"activity":"swim","distance":1334344455555,"calories":233}'
curl --request POST --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities --data '{"activity":"run","distance":133455555,"calories":100}'
curl --request POST --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities --data '{"activity":"ski","distance":133455555,"calories":50}'

curl --request GET --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities/1
curl --request GET --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities/2
curl --request GET --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities/3

curl --request GET --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities/4


curl --request GET --header 'Content-Type: application/json' http://server:8080/api/v1/test/activities

curl --request GET --header 'Content-Type: application/json' http://server:8080/api/v1/test/calories