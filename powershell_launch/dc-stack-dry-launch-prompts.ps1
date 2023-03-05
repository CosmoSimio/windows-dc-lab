# Set the AWS region
$region = "us-east-2"

# Set the CloudFormation stack name
$stackName = Read-Host -Prompt "Enter CloudFormation stack name"

# Set the path to the CloudFormation template
$templatePath = ".\windows-dc-labstack.yaml"

# Set the parameter overrides for the CloudFormation stack
$params = @{}
$params["VpcId"] = Read-Host -Prompt "Enter VpcId"
$params["SecurityGroupId"] = Read-Host -Prompt "Enter SecurityGroupId"
$params["KeyName"] = Read-Host -Prompt "Enter KeyName"
$params["DomainControllerName"] = Read-Host -Prompt "Enter DomainControllerName"
$params["CollectorServerName"] = Read-Host -Prompt "Enter CollectorServerName"
$params["DomainName"] = Read-Host -Prompt "Enter DomainName"
$params["DomainAdmin1"] = Read-Host -Prompt "Enter DomainAdmin1"
$params["DomainAdmin1Password"] = Read-Host -Prompt "Enter DomainAdmin1Password"
$params["DomainAdmin2"] = Read-Host -Prompt "Enter DomainAdmin2"
$params["DomainAdmin2Password"] = Read-Host -Prompt "Enter DomainAdmin2Password"
$params["DomainAdmin3"] = Read-Host -Prompt "Enter DomainAdmin3"
$params["DomainAdmin3Password"] = Read-Host -Prompt "Enter DomainAdmin3Password"
$params["MSSQLInstanceName"] = Read-Host -Prompt "Enter MSSQLInstanceName"
$params["MSSQLPassword"] = Read-Host -Prompt "Enter MSSQLPassword"

# Convert the $params hashtable to an array of Key=Value pairs
$paramsArray = $params.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }

# Deploy the stack
aws cloudformation deploy `
    --stack-name $stackName `
    --template-file $templatePath `
    --parameter-overrides $paramsArray `
    --no-execute-changeset