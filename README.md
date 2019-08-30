# Zammad CTI intergration with FusionPBX / Freeswitch
See all your incomming calls in Zammad and keep track of missed calls. 

## Getting Started

## Prerequisites

Make sure you have installed and loaded freeswitch mod_curl

```
apt install freeswitch-mod-curl
```

and add it to the freeswitch modules list.

## Installing

Copy all lua files to `/usr/share/freeswitch/scripts` 
Edit the configuration file `zammad_config.lua` and add your Zammad CTI URL.

## Update Dialplan

Following settings need to be added to the dialplan 

```
action lua zam_newcall.lua
action export session_in_hangup_hook=true
action export nolocal:api_hangup_hook=lua zam_hangupcall.lua
action export nolocal:execute_on_answer=lua zam_answercall.lua
action export original_to=${sip_req_user}
action export original_call_id=${sip_call_id}
```
should look something like this 

![Dialplan](https://raw.githubusercontent.com/lcx/zammad-fusionpbx-cti/master/inboundroutezammad.jpg)

## Authors

* DigitalDaz - creator
* Cristian Livadaru - added Readme and config file

## Acknowledgments
This is basically just copied from this blog post [Zammad Ticketing System Integration](https://www.pbxforums.com/threads/zammad-ticketing-system-integration.3123/) created by DigitalDaz