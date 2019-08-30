require("zammad_config")
require("zammad_functions")

api = freeswitch.API();

log("sip_to_user", session:getVariable("sip_to_user"))
log("sip_from_user", session:getVariable("sip_from_user"))
log("original_to", session:getVariable("original_to"))
log("original_call_id", session:getVariable("original_call_id"))
log("hangup_cause", session:getVariable("hangup_cause"))

get_response = api:execute("curl", zammad_api_url .. " post event=hangup&answeringNumber="..session:getVariable("sip_to_user").."&from="..session:getVariable("sip_from_user").."&to="..session:getVariable("original_to").."&direction=in&callId="..session:getVariable("original_call_id").."&cause="..session:getVariable("hangup_cause"));
