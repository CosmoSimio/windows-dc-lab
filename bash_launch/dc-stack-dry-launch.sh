#!/bin/bash

# Set the AWS region
region="us-east-2"

# Set the CloudFormation stack name
stackName="isaac-windows-dc-labstack"

# Set the path to the CloudFormation template
templatePath="./windows-dc-labstack.yaml"

# Set the parameter overrides for the CloudFormation stack
params="VpcId=vpc-12345678"
params="$params SecurityGroupId=sg-12345678"
params="$params KeyName=mykeypair"
params="$params DomainControllerName=dcinstance"
params="$params CollectorServerName=collectorinstance"
params="$params DomainName=mydomain.local"
params="$params DomainAdmin1=admin1"
params="$params DomainAdmin1Password=Password123"
params="$params DomainAdmin2=admin2"
params="$params DomainAdmin2Password=Password456"
params="$params DomainAdmin3=admin3"
params="$params DomainAdmin3Password=Password789"
params="$params MSSQLInstanceName=sqlinstance"
params="$params MSSQLPassword=MyPassw0rd"
params="$params DomainNetbiosName=mydomain"
params="$params SafeModeAdministratorPassword=AdminPassword123"

# Deploy the stack
aws cloudformation deploy \
    --stack-name $stackName \
    --template-file $templatePath \
    --parameter-overrides $params \
    --no-execute-changeset \
    --region $region