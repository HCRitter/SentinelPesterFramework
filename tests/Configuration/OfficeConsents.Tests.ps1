param (
    [Parameter(Mandatory = $true)]
    [string]$workspaceName,

    [Parameter(Mandatory = $true)]
    [string]$resourceGroup,

    [Parameter(Mandatory = $true)]
    [string]$subscriptionId,

    [Parameter(Mandatory = $false)]
    [string]$CICDPathRoot
)

BeforeAll {
    # More information about the setting can be found here:
    # https://learn.microsoft.com/en-us/rest/api/securityinsights/preview/security-ml-analytics-settings/list?tabs=HTTP
    $RestUri = "https://management.azure.com/subscriptions/{0}/resourceGroups/{1}/providers/Microsoft.OperationalInsights/workspaces/{2}/providers/Microsoft.SecurityInsights/officeConsents?api-version=2022-12-01-preview" -f $subscriptionId, $resourceGroup, $workspaceName
    $OfficeConsents = Invoke-AzRestMethod -Method GET -Uri $RestUri | Select-Object -ExpandProperty Content | ConvertFrom-Json | Select-Object -ExpandProperty value
}

Describe "Office Consents" -Tag "OfficeConsents" {
    # To be defined
}