#!/bin/bash

USERNAME=$(whoami)
HOSTNAME=$(hostname)

[[ "$HOSTNAME" == "s1.ct8.pl" ]] && WORKDIR="domains/${USERNAME}.ct8.pl/logs" || WORKDIR="domains/${USERNAME}.serv00.net/logs"
[ -d "$WORKDIR" ] || (mkdir -p "$WORKDIR" && chmod 777 "$WORKDIR")

CRON_NEZHA="nohup ${WORKDIR}/npm -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${NEZHA_TLS} >/dev/null 2>&1 &"
CRON_SB="nohup ${WORKDIR}/web run -c config.json >/dev/null 2>&1 &"
CRON_ARGO="nohup ${WORKDIR}/bot $args >/dev/null 2>&1 &"
CRON_JOB="0 */12 * * *" # 在面板中添加每 12 小时运行任务的 corn

echo "检查并添加 crontab 任务"

if [ -e "${WORKDIR}/npm" ] && [ -e "${WORKDIR}/web" ] && [ -e "${WORKDIR}/bot" ]; then
    echo "添加 nezha & singbox & argo 的 crontab 重启任务"
    (crontab -l | grep -F "@reboot pkill -x -u $(whoami) && ${CRON_NEZHA} && ${CRON_SB} && ${CRON_ARGO}") || (crontab -l; echo "@reboot pkill -x -u $(whoami) && ${CRON_NEZHA} && ${CRON_SB} && ${CRON_ARGO}") | crontab -
    (crontab -l | grep -F "* * pgrep -x \"npm\" > /dev/null || ${CRON_NEZHA}") || (crontab -l; echo "${CRON_JOB} pgrep -x \"npm\" > /dev/null || ${CRON_NEZHA}") | crontab -
    (crontab -l | grep -F "* * pgrep -x \"web\" > /dev/null || ${CRON_SB}") || (crontab -l; echo "${CRON_JOB} pgrep -x \"web\" > /dev/null || ${CRON_SB}") | crontab -
    (crontab -l | grep -F "* * pgrep -x \"bot\" > /dev/null || ${CRON_ARGO}") || (crontab -l; echo "${CRON_JOB} pgrep -x \"bot\" > /dev/null || ${CRON_ARGO}") | crontab -

elif [ -e "${WORKDIR}/npm" ]; then
    echo "添加 nezha 的 crontab 重启任务"
    (crontab -l | grep -F "@reboot pkill -x \"npm\" && ${CRON_NEZHA}") || (crontab -l; echo "@reboot pkill -x \"npm\" && ${CRON_NEZHA}") | crontab -
    (crontab -l | grep -F "* * pgrep -x \"npm\" > /dev/null || ${CRON_NEZHA}") || (crontab -l; echo "${CRON_JOB} pgrep -x \"npm\" > /dev/null || ${CRON_NEZHA}") | crontab -

elif [ -e web ]; then
    echo "添加 sing-box 的 crontab 重启任务"
    (crontab -l | grep -F "@reboot pkill -x \"web\" && ${CRON_SB}") || (crontab -l; echo "@reboot pkill -x \"web\" && ${CRON_SB}") | crontab -
    (crontab -l | grep -F "* * pgrep -x \"web\" > /dev/null || ${CRON_SB}") || (crontab -l; echo "${CRON_JOB} pgrep -x \"web\" > /dev/null || ${CRON_SB}") | crontab -

elif [ -e bot ]; then
    echo "添加 Argo 的 crontab 重启任务"
    (crontab -l | grep -F "@reboot pkill -x \"bot\" && ${CRON_ARGO}") || (crontab -l; echo "@reboot pkill -x \"bot\" && ${CRON_ARGO}") | crontab -
    (crontab -l | grep -F "* * pgrep -x \"bot\" > /dev/null || ${CRON_ARGO}") || (crontab -l; echo "${CRON_JOB} pgrep -x \"bot\" > /dev/null || ${CRON_ARGO}") | crontab -
fi
