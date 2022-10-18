Import-Module ActiveDirectory

$Domain="@ns.fctestin.com"

$NewUsersList=Import-CSV "aduser.csv"

ForEach ($User in $NewUsersList) {

$fullname=$User.FullName

$givenname=$User.givenName

$samaccountname=$User.sAMAccountName

$sn=$User.sn

$userprincipalname=$User.sAMAccountName+$Domain

$useremail=$User.email

New-ADUser -PassThru -Path "OU=Users,OU=US,DC=ns,DC=fctestin,DC=com" -AccountPassword (ConvertTo-SecureString test@1234562 -AsPlainText -Force) -CannotChangePassword $False -DisplayName $fullname -GivenName $givenname -Name $fullname -SamAccountName $samaccountname -Surname $sn -email $useremail -UserPrincipalName $userprincipalname

}