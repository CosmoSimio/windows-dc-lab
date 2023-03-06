#!/bin/bash

# Set the AWS region
region="us-east-2"

# Set the CloudFormation stack name
read -p "Enter CloudFormation stack name: " stackName

# Set the path to the CloudFormation template
templatePath="./windows-dc-labstack.yaml"

# Set the parameter overrides for the CloudFormation stack
declare -A params
read -p "Enter VpcId: " params["VpcId"]
read -p "Enter SecurityGroupId: " params["SecurityGroupId"]
read -p "Enter KeyName: " params["KeyName"]
read -p "Enter DomainControllerName: " params["DomainControllerName"]
read -p "Enter CollectorServerName: " params["CollectorServerName"]
read -p "Enter DomainName: " params["DomainName"]
read -p "Enter DomainNetbiosName: " params["DomainNetbiosName"]
read -p "Enter SafeModeAdministratorPassword: " params["SafeModeAdministratorPassword"]
read -p "Enter DomainAdmin1: " params["DomainAdmin1"]
read -p "Enter DomainAdmin1Password: " params["DomainAdmin1Password"]
read -p "Enter DomainAdmin2: " params["DomainAdmin2"]
read -p "Enter DomainAdmin2Password: " params["DomainAdmin2Password"]
read -p "Enter DomainAdmin3: " params["DomainAdmin3"]
read -p "Enter DomainAdmin3Password: " params["DomainAdmin3Password"]
read -p "Enter MSSQLInstanceName: " params["MSSQLInstanceName"]
read -p "Enter MSSQLPassword: " params["MSSQLPassword"]

# Construct the parameter overrides string in the format Key=Value
paramsString=""
for key in "${!params[@]}"
do
    paramsString+=" $key=${params[$key]}"
done

# Deploy the stack
aws cloudformation deploy \
    --stack-name "$stackName" \
    --template-file "$templatePath" \
    --parameter-overrides $paramsString \
    --no-execute-changeset \
    --region $region