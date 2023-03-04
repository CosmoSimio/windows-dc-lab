#!/bin/bash

# Set the AWS region
region="us-east-2"

# Set the CloudFormation stack name
stackName="isaac-windows-dc-lab"

# Set the path to the CloudFormation template
templatePath="./windows-dc-lab.yaml"

# Set the parameter overrides for the CloudFormation stack
params="VpcId=vpc-12345678 " \
       "SecurityGroupId=sg-12345678 " \
       "KeyName=mykeypair " \
       "DomainControllerName=dcinstance " \
       "CollectorServerName=collectorinstance " \
       "DomainName=mydomain.local " \
       "DomainAdmin1=admin1 " \
       "DomainAdmin1Password=Password123 " \
       "DomainAdmin2=admin2 " \
       "DomainAdmin2Password=Password456 " \
       "DomainAdmin3=admin3 " \
       "DomainAdmin3Password=Password789 " \
       "MSSQLInstanceName=sqlinstance " \
       "MSSQLPassword=MyPassw0rd"

# Deploy the stack
aws cloudformation deploy \
    --stack-name $stackName \
    --template-file $templatePath \
    --parameter-overrides $params \
    --no-execute-changeset