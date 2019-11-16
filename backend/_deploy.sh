#!/bin/sh

PLEASE_SET="please make sure the following variables are set, then re-run this script: \n\t- SQL_DB\n\t- SQL_USER\n\t- SQL_PASS\n\t- SQL_CONNECTION_NAME\n\t- GAE_PROJECT\n\t- GAE_SERVICE \n\t- GS_BUCKET_NAME\n\t- GOOGLE_APPLICATION_CREDENTIALS\n\t- EMAIL_HOST_USER\n\t- EMAIL_HOST_PASSWORD"


if [ $PROD_MODE -eq 1 ]; then

    if [ -z ${PROD_SECRET_KEY+x} ];
    then
    echo "PROD_SECRET_KEY is unset"
    exit 1;
    fi

else

export PROD_SECRET_KEY="x"

fi


if [ -z ${SQL_DB+x} ];
then
echo "SQL_DB is unset"
echo $PLEASE_SET
exit 1;
fi

if [ -z ${SQL_USER+x} ];
then echo "SQL_USER is unset"
exit 1;
fi

if [ -z ${SQL_PASS+x} ];
then echo "SQL_PASS is unset"
echo $PLEASE_SET
exit 1;
fi

if [ -z ${SQL_CONNECTION_NAME+x} ];
then echo "SQL_CONNECTION_NAME is unset"
echo $PLEASE_SET
exit 1;
fi

if [ -z ${GAE_PROJECT+x} ];
then echo "GAE_PROJECT is unset"
echo $PLEASE_SET
exit 1;
fi

if [ -z ${GAE_SERVICE+x} ];
then
echo "GAE_SERVICE is unset"
echo $PLEASE_SET
exit 1;
fi

if [ -z ${GS_BUCKET_NAME+x} ];
then
echo "GS_BUCKET_NAME is unset"
echo $PLEASE_SET
exit 1;
fi

if [ -z ${GOOGLE_APPLICATION_CREDENTIALS+x} ];
then
echo "GOOGLE_APPLICATION_CREDENTIALS is unset. Please use credentials with read/write access to GC storage"
echo $PLEASE_SET
exit 1;
fi


if [ -z ${EMAIL_HOST_USER+x} ];
then
echo "EMAIL_HOST_USER is unset. Please use credentials with read/write access to GC storage"
echo $PLEASE_SET
exit 1;
fi


if [ -z ${EMAIL_HOST_PASSWORD+x} ];
then
echo "EMAIL_HOST_PASSWORD is unset. Please use credentials with read/write access to GC storage"
echo $PLEASE_SET
exit 1;
fi

# based on https://cloud.google.com/python/django/appengine

echo "collecting static files"
python manage.py collectstatic

sed -e "s/\$SQL_DB/$SQL_DB/" -e "s/\$SQL_USER/$SQL_USER/" -e "s/\$SQL_PASS/$SQL_PASS/"  -e "s/\$SQL_CONNECTION_NAME/$SQL_CONNECTION_NAME/" -e "s/\$GAE_SERVICE/$GAE_SERVICE/" -e "s/\$GS_BUCKET_NAME/$GS_BUCKET_NAME/" -e "s/\$GAE_PROJECT/$GAE_PROJECT/" -e "s/\$EMAIL_HOST_PASSWORD/$EMAIL_HOST_PASSWORD/" -e "s/\$EMAIL_HOST_USER/$EMAIL_HOST_USER/"   -e "s/\$PROD_SECRET_KEY/$PROD_SECRET_KEY/" -e "s/\$PROD_MODE/$PROD_MODE/" app-staging.template.yaml > app-staging.yaml


python manage.py migrate # run the migrations

cp $GOOGLE_APPLICATION_CREDENTIALS $PWD/credentials.json

yes | gcloud app deploy app-staging.yaml --project $GAE_PROJECT

rm app-staging.yaml
rm $PWD/credentials.json
yes | rm -r collectstatic