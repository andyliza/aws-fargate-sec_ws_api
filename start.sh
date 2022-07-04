#!/usr/bin/env bash
python3 sqlsetup.py

/ecs-fargate-pv1.4-falco/bin/falco &
pdig -a ./init.sh &

service nginx start
# uwsgi --ini uwsgi.ini
python3 api.py 

