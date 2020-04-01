#Inconsistent content-type behaviour when a charset is defined with an invalid and valid json when using Connexion
#
# Note 'Content-Type: application/json' is the only one accepted in my OpenApi file

#(1) I can notice for valid json there is a tolerance to allow 'Content-Type: application/json; charset=utf-8'
# even if not defined in my OpenApi file (is this expected?. Should we raise unsupported media type error?)
#(2) For invalid JSON 'Content-Type: application/json' is still accepted (as expected),
#(3) But for invalid json when the charset is present: an unsupported media type error is raised (not expected)
# I would expect it not to be raised, as for a valid json in (1) to have a consistent behaviour.


#I saw this issue with my non regression tool (Karate) which is adding by default the charset
#I disabled this behaviour for testing invalid JSON.

# So the question :
# - Should we have consistent behaviour for valid and invalid json?
# - Is it fine to have tolerance for the charset in valid json case, would it make more sense to define it explicitly:
# From here it seems possible: https://github.com/apiaryio/dredd/issues/1391.

# Here are the command to reproduce the issue referencing case (1), (2) and (3)
set -o xtrace
sleep 5
printf 'Nominal working case\n-----\n'
curl --request POST --header 'Content-Type: application/json' http://server:8080/api/v1/test/entry --data '{"kind" : "time"}'

printf 'Nominal error case with unsupported media type - 415 is returned\n-----\n'
curl --request POST --header 'Content-Type: application/xml' http://server:8080/api/v1/test/entry --data '{"kind" : "time"}'


printf '(1) Tolerance to allow Content-Type: application/json; charset=utf-8 [EVEN IF NOT DEFINED IN OPENAPI?]\n-----\n'
curl --request POST --header 'Content-Type: application/json; charset=utf-8' http://server:8080/api/v1/test/entry --data '{"kind" : "time"}'

printf '(2) Invalid JSON: Content-Type: application/json is accepted [EXPECTED]\n-----\n'
curl --request POST --header 'Content-Type: application/json' http://server:8080/api/v1/test/entry --data '{"kind" "time"}'

printf '(3) Invalid JSON Content-Type: application/json; charset=utf-8 is not accepted [NOT CONSISTENT WITH VALID JSON]\n-----\n'
curl --request POST --header 'Content-Type: application/json; charset=utf-8' http://server:8080/api/v1/test/entry --data '{"kind" "time"}'
