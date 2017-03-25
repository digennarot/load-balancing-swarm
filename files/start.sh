#!/bin/bash
service nginx start
echo never > /sys/kernel/mm/transparent_hugepage/enabled
consul-template -consul=$CONSUL_URL -template="/templates/default.ctmpl:/etc/nginx/conf.d/default.conf:service nginx reload"
