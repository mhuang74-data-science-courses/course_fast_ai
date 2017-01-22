#!/usr/bin/env bash
trap "set +x; sleep 3; set -x" DEBUG

export securityGroupId=sg-3e4db046
export subnetId=subnet-354daa7c

export instanceId=`aws ec2 run-instances --image-id ami-bc508adc --count 1 --instance-type p2.xlarge --key-name aws-key --security-group-ids $securityGroupId --subnet-id $subnetId --associate-public-ip-address --block-device-mapping "[ { \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"VolumeSize\": 128, \"VolumeType\": \"gp2\" } } ]" --query 'Instances[0].InstanceId' --output text`
export allocAddr=`aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text`

echo Waiting for instance start...
aws ec2 wait instance-running --instance-ids $instanceId
sleep 10 # wait for ssh service to start running too
export assocId=`aws ec2 associate-address --instance-id $instanceId --allocation-id $allocAddr --query 'AssociationId' --output text`
export instanceUrl=`aws ec2 describe-instances --instance-ids $instanceId --query 'Reservations[0].Instances[0].PublicDnsName' --output text`
echo securityGroupId=$securityGroupId
echo subnetId=$subnetId
echo instanceId=$instanceId
echo instanceUrl=$instanceUrl
echo Connect: ssh -i ~/.ssh/aws-key.pem ubuntu@$instanceUrl

