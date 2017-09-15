#!/bin/bash
set -euf -o pipefail
dbgroupid=$(aws ec2 describe-security-groups --group-names "db"| jq -r '.SecurityGroups[0].GroupId')

if [ -n "$(aws rds describe-db-instances --db-instance-identifier csye6225)" ]; then
    echo 'csye6225 mysql db already exists'
    exit 0
fi

aws rds create-db-instance \
    --db-name csye6225 \
    --allocated-storage 10 \
    --db-instance-identifier csye6225 \
    --db-instance-class db.t2.micro \
    --engine mysql \
    --master-username csye6225 \
    --master-user-password csye6225 \
    --no-multi-az \
    --no-publicly-accessible \
    --vpc-security-group-ids $dbgroupid \

