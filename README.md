# zabbix_for_slack_notify

SlackのIncoming WebHooksを発行して
スクリプト内のslack_urlに入れてください

# アクションの設定

- デフォルトの件名

 ```
 ** PROBLEM alert - {HOST.NAME} / {TRIGGER.NAME} is CRITICAL **
 ```

- デフォルトのメッセージ

 ```
 HOST: {HOST.NAME} \ TRIGGER_NAME: {TRIGGER.NAME} \ TRIGGER_STATUS: {TRIGGER.STATUS} \ TRIGGER_SEVERITY: {TRIGGER.SEVERITY} \ DATETIME: {DATE} / {TIME} \ ITEM_NAME: {ITEM.NAME1} \ ITEM_KEY: {ITEM.KEY1} \ ITEM_VALUE: {ITEM.VALUE1}  \ EVENT_ID: {EVENT.ID} \ TRIGGER_URL: {TRIGGER.URL}
 ```

- リカバリメッセージにチェックを入れる
- 復旧通知の件名

 ```
 ** RECOVERY alert - {HOST.NAME} / {TRIGGER.NAME} is OK **
 ```

- リカバリメッセージ

 ```
 HOST: {HOST.NAME} \ TRIGGER_NAME: {TRIGGER.NAME} \ TRIGGER_STATUS: {TRIGGER.STATUS} \ TRIGGER_SEVERITY: {TRIGGER.SEVERITY} \ DATETIME: {DATE} / {TIME} \ ITEM_NAME: {ITEM.NAME1} \ ITEM_KEY: {ITEM.KEY1} \ ITEM_VALUE: {ITEM.VALUE1}  \ EVENT_ID: {EVENT.ID} \ TRIGGER_URL: {TRIGGER.URL}
 ```
