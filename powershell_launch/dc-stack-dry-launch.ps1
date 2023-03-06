# Set the AWS region
$region = "us-east-2"

# Set the CloudFormation stack name
$stackName = "isaac-windows-dc-lab"

# Set the path to the CloudFormation template
$templatePath = ".\windows-dc-labstack.yaml"

# Set the parameter overrides for the CloudFormation stack
$params = "VpcId=vpc-12345678", `
          "SecurityGroupId=sg-12345678", `
          "KeyName=mykeypair", `
          "DomainControllerName=ec2windc1", `
          "CollectorServerName=ec2wincoll1", `
          "DomainName=isaaclabdom2.local", `
          "DomainNetbiosName=ISAACLABDOM2", `
          "DomainAdmin1=isaac.paramo", `
          "DomainAdmin1Password=Password123", `
          "DomainAdmin2=svc_lacoll", `
          "DomainAdmin2Password=Password456", `
          "DomainAdmin3=svc_dacoll", `
          "DomainAdmin3Password=Password789", `
          "MSSQLInstanceName=ec2winsql1", `
          "MSSQLPassword=MyPassw0rd", `
          "SafeModeAdministratorPassword=SafeMode123"

# Deploy the stack
aws cloudformation deploy `
    --stack-name $stackName `
    --template-file $templatePath `
    --parameter-overrides $params `
    --no-execute-changeset