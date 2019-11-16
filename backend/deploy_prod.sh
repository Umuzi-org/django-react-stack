#!/bin/sh

export GAE_SERVICE="management-info-sys"
export GS_BUCKET_NAME="management-information-system"

export PROD_MODE=1

/bin/sh ./_deploy.sh


