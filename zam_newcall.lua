require("zammad_config")
require("zammad_functions")

if (session:ready()) then
  log("sip_to_user", session:getVariable("sip_to_user"))
  log("sip_from_user", session:getVariable("sip_from_user"))
  log("original_to", session:getVariable("original_to"))
  log("sip_call_id", session:getVariable("sip_call_id"))

  session:execute("curl", zammad_api_url .. " post event=newCall&from="..session:getVariable("sip_from_user").."&to="..session:getVariable("sip_to_user").."&direction=in&callId="..session:getVariable("sip_call_id").."&user[]=Ticket%20System");
end
