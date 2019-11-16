#!/bin/sh

export GAE_SERVICE="management-info-sys"
export GS_BUCKET_NAME="management-information-system-staging"
export PROD_MODE=0

/bin/sh ./_deploy.sh