## since it's easier to convert same instance between t2 and p2, use Tags to name and query instances
### name my pair Light and Day
alias aws-get-light='export instanceId=`aws ec2 describe-instances --filters --filters "Name=tag:Name,Values=Light" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
alias aws-get-day='export instanceId=`aws ec2 describe-instances --filters --filters "Name=tag:Name,Values=Day" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
alias aws-small='aws ec2 modify-instance-attribute --instance-id $instanceId --instance-type t2.large'
alias aws-big='aws ec2 modify-instance-attribute --instance-id $instanceId --instance-type p2.xlarge'
## once instance found and configured, ready to start and go
alias aws-start='aws ec2 start-instances --instance-ids $instanceId && aws ec2 wait instance-running --instance-ids $instanceId && export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress"` && echo $instanceIp'
alias aws-ip='export instanceIp=`aws ec2 describe-instances --filters "Name=instance-id,Values=$instanceId" --query "Reservations[0].Instances[0].PublicIpAddress"` && echo $instanceIp'
alias aws-ssh='ssh -i ~/.ssh/aws-key.pem -L 127.0.0.1:8888:$instanceIp:8888 -L 127.0.0.1:8889:$instanceIp:8889 ubuntu@$instanceIp'
alias aws-stop='aws ec2 stop-instances --instance-ids $instanceId'
## Deprecated
# alias aws-pre-start='export allocationId=$(aws ec2 allocate-address --domain vpc | awk "{print \$1}") && echo $allocationId && export associationId=$(aws ec2 associate-address --allocation-id $allocationId --instance-id $instanceId) && echo $associationId && export instanceIp=$(aws ec2 describe-addresses --public-ips --filters "Name=instance-id,Values=$instanceId" | awk "{print \$9}") && echo $instanceIp'
# alias aws-post-stop='aws ec2 disassociate-address --association-id $associationId && aws ec2 describe-addresses | awk "{print \$2}" | xargs -n 1 aws ec2 release-address --allocation-id'
# alias aws-get-p2='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=p2.xlarge" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'
# alias aws-get-t2='export instanceId=`aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped,Name=instance-type,Values=t2.large" --query "Reservations[0].Instances[0].InstanceId"` && echo $instanceId'