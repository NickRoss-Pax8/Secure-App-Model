$ApplicationId = '<App ID>'
$ApplicationSecret = '<App Secret>'
$TenantID = '<TenantID>'
$secPas = $ApplicationSecret| ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($ApplicationId, $secPas)
$token = New-PartnerAccessToken -ApplicationId $ApplicationID -Scopes 'https://api.partnercenter.microsoft.com/user_impersonation' -ServicePrincipal -Credential $credential -Tenant $TenantID -UseAuthorizationCode
$Exchangetoken = New-PartnerAccessToken -ApplicationId 'a0c73c16-a7e3-4564-9a95-2bdf47383716' -Scopes 'https://outlook.office365.com/.default' -Tenant $($spn.AppOwnerTenantID) -UseDeviceAuthentication
Write-Host "================ Secrets ================"
Write-Host "`$ApplicationId         = $($applicationID)"
Write-Host "`$ApplicationSecret     = $($ApplicationSecret)"
Write-Host "`$TenantID              = $($tenantid)"
write-host "`$RefreshToken          = $($token.refreshtoken)" -ForegroundColor Blue
write-host "`$ExchangeRefreshToken  = $($ExchangeToken.Refreshtoken)" -ForegroundColor Green
Write-Host "================ Secrets ================"
Write-Host "    SAVE THESE IN A SECURE LOCATION     "
