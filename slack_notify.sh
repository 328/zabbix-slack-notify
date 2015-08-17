#!/bin/bash

# config
slack_url=''
slack_username='Zabbix'
channel="$1"
title="$2"
params="$3"
emoji=':joy:'
timeout="5"
cmd_curl="/usr/bin/curl"


# set params
host="`echo ${params} | cut -d '\' -f1 | cut -d ':' -f2`"
trigger_name="`echo ${params} | cut -d '\' -f2 | cut -d ':' -f2`"
trigger_status="`echo ${params} | cut -d '\' -f3 | cut -d ':' -f2 | tr -d ' ' `"
trigger_severity="`echo ${params} | cut -d '\' -f4 | cut -d ':' -f2 | tr -d ' ' `"
datetime="`echo ${params} | cut -d '\' -f5 | awk -F'DATETIME: ' '{print $2}'`"
item_name="`echo ${params} | cut -d '\' -f6 | cut -d ':' -f2`"
item_value="`echo ${params} | cut -d '\' -f7 | cut -d ':' -f2`"
event_id="`echo ${params} | cut -d '\' -f8 | cut -d ':' -f2`"
trigger_url="`echo ${params} | cut -d '\' -f9 | cut -d ':' -f2`"

# set color label
if [ "${trigger_status}" == 'OK' ]; then
  case "${trigger_severity}" in
    'Information')
      color="#439FE0"
      ;;
    *)
      color="good"
      ;;
  esac
elif [ "${trigger_status}" == 'PROBLEM' ]; then
  case "${trigger_severity}" in
    'Information')
      color="#439FE0"
      ;;
    'Warning')
      color="#FFFF00"
      ;;
    'Average')
      color="#FF4500"
      ;;
    'High')
      color="#FF0000"
      ;;
    'Disaster')
      color="#AA0114"
      ;;
    *)
      color="#AA0114"
      ;;
  esac
else
  color="#808080"
fi

# set payload
payload="payload={ \
  \"channel\": \"${channel}\", \
  \"username\": \"${slack_username}\", \
  \"icon_emoji\": \"${emoji}\", \
  \"attachments\": [ \
    { \
      \"fallback\": \"Date / Time: ${datetime} - ${title}\", \
      \"title\": \"${title}\", \
      \"title_link\": \"${trigger_url}\", \
      \"color\": \"${color}\", \
      \"fields\": [ \
        { \
            \"title\": \"Date / Time\", \
            \"value\": \"${datetime}\", \
            \"short\": true \
        }, \
        { \
            \"title\": \"Status\", \
            \"value\": \"${trigger_severity}\", \
            \"short\": true \
        }, \
        { \
            \"title\": \"Host\", \
            \"value\": \"${host}\", \
            \"short\": true \
        }, \
        { \
            \"title\": \"Trigger\", \
            \"value\": \"${trigger_name}: ${item_value}\", \
            \"short\": true \
        } \
      ] \
    } \
  ] \
}"

# send to slack
${cmd_curl} -m ${timeout} --data-urlencode "${payload}" "${slack_url}"
