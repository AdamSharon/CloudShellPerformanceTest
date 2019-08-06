
# download compiled cloudshell and customer DB on the clean Windows OS
# that have already MS SQL and AWS CLI installed and configured for performanceTester@quali.com


# this is a folder name that is a Guid
$pathToApp = Get-Item Env:AWS_S3_PATH_TO_APP

# this is a folder name that is the name of the customer
$pathToDB = Get-Item Env:AWS_S3_PATH_TO_DB

<#
the structor of s3 is:

s3://performanceTest/
  - Guid       -> this is set with each compilation
    - Batch
    - Drop

s3://CustomerDBs
    - Verizon
      - Quali.bak
      - QualiInsight.bak
      - QualiResults.bak
    - Cisco DevNet
      - Quali.bak
      - QualiInsight.bak
      - QualiResults.bak
#>

aws s3 sync c:\CloudShell\ "s3://performanceTest/$pathToApp"

# restore the DB
aws s3 sync c:\DBs\ "s3://CustomerDBs/$pathToDB"
restoreDB.sql






<#


# now optionaly restore the DB

if ($pathToDB -eq "")
{
    return;
}





if ($AWS_User -eq "")
{
    Write-Host "The AWS_USER environment variable was NOT detected"
    return 
}

if ($AWS_Password -eq "")
{
    Write-Host "The AWS_PASSWORD environment variable was NOT detected"
    return 
}

if ($pathToApp -eq "")
{
    Write-Host "The AWS_S3_PATH_TO_APP environment variable was NOT detected"
    return 
}

if ($pathToDB -eq "")
{
    Write-Host "The AWS_S3_PATH_TO_DB environment variable was NOT detected"
    return 
}
#>

