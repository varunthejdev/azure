#!/bin/bash -e

object="Cloud Service-AzurePasswordManagement-SPN_ALL_SVC_SUBSCRIPTIONADMIN"
query="safe=172B_PRB_P_CLD_AWS_LA_RT_M;object=${object};folder=root"
app_id='AIM_CloudTeam'
output='Password,PassProps.ApplicationID'
delimiter='#@#'

read -r secret id < <(/opt/CARKaim/sdk/clipasswordsdk GetPassword -p AppDescs.AppID="${app_id}" -p Query="${query}" -o "${output}" -d "${delimiter}" | awk -F "${delimiter}" '{print $1,$2}')

export http_proxy=http://22.98.63.16:80
export https_proxy=http://22.98.63.16:80

export ARM_SUBSCRIPTION_ID=11a3abd7-5215-4f93-b08b-2a22b11349a8
export ARM_CLIENT_ID=${id}
export ARM_CLIENT_SECRET=${secret}
export ARM_TENANT_ID="425132e4-ceff-47ec-991d-06890a943af3"
