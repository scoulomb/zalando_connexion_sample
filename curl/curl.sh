### Description

#Given following OpenApi [definition](../documentation/openapi/openapi.yaml)
#Where I accept a 'Content-Type: application/json', with no charset
#We found an inconsistent behaviour when a charset is defined in Content-Type header value with an invalid and valid json when using Connexion

#(case 1) We can notice for valid json there is a tolerance to allow 'Content-Type: application/json; charset=utf-8'
# even if not defined in the OpenApi file (is this expected?. Should we raise unsupported media type error since not defined?)
#(case 2) For invalid JSON 'Content-Type: application/json' is still accepted (as expected),
#(case 3) But for invalid json when the charset is present: an unsupported media type error is raised (not expected)

### Expected behaviour

# - I would expect case 3 to not raise unsupported media type error to be consistent with a valid json (case 1) when a charset is present
# - Alternatively we could remove the tolerance in case 1, if no charset is defined in OpenApi file, we could raise unsupported media type error
# if Content-Type header contains a charset. In OpenApi it seems possible to explicitly declare a charset as shown here:  https://github.com/apiaryio/dredd/issues/1391

#I saw this issue with my non regression tool (Karate) which is adding by default the charset
#I disabled this behaviour for testing invalid JSON.

### Steps to reproduce

# Here are the command to reproduce the issue referencing case (1), (2) and (3)
set -o xtrace
sleep 5
printf 'Nominal working case\n-----\n'
curl --request POST --header 'Content-Type: application/json' http://server:8080/api/v1/test/entry --data '{"kind" : "time"}'

printf 'Nominal error case with unsupported media type - 415 is returned\n-----\n'
curl --request POST --header 'Content-Type: application/xml' http://server:8080/api/v1/test/entry --data '{"kind" : "time"}'


printf '(case 1) Tolerance to allow Content-Type: application/json; charset=utf-8 [EVEN IF NOT DEFINED IN OPENAPI?]\n-----\n'
curl --request POST --header 'Content-Type: application/json; charset=utf-8' http://server:8080/api/v1/test/entry --data '{"kind" : "time"}'

printf '(case 2) Invalid JSON: Content-Type: application/json is accepted [EXPECTED]\n-----\n'
curl --request POST --header 'Content-Type: application/json' http://server:8080/api/v1/test/entry --data '{"kind" "time"}'

printf '(case 3) Invalid JSON Content-Type: application/json; charset=utf-8 is not accepted [NOT CONSISTENT WITH VALID JSON]\n-----\n'
curl --request POST --header 'Content-Type: application/json; charset=utf-8' http://server:8080/api/v1/test/entry --data '{"kind" "time"}'


# This minimal project can run the test: by doing
# sudo docker-compose up --build > sample.out

# This was used for this: https://github.com/zalando/connexion/issues/1202