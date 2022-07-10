function Test-SecretVault {
	[CmdletBinding()]
	param (
		[string]$VaultName,
		[hashtable]$AdditionalParameters
	)
	[bool][System.DirectoryServices.ActiveDirectory.Domain]::GetComputerDomain()
}

function Get-SecretInfo {
	[CmdletBinding()]
	param (
		[Alias('Name')][string]$Filter,
		[string]$VaultName,
		[hashtable] $AdditionalParameters
	)
	if ($AdditionalParameters.ContainsKey('Verbose') -and ($AdditionalParameters['Verbose'] -eq $true)) {
		$VerbosePreference = 'Continue'
	}
	Write-Verbose "Get-SecretInfo -Filter is $Filter"
	Get-ADComputer -LDAPFilter "(&(ms-mcs-admpwd=*)(name=$filter))" -Properties ms-Mcs-AdmPwdExpirationTime |
	ForEach-Object {
		return @(, [Microsoft.PowerShell.SecretManagement.SecretInformation]::new(
				$_.Name,
				"String",
				$VaultName,
				@{'ExpirationTime' = ($_.'ms-Mcs-AdmPwdExpirationTime' -as [datetime])}))
	}
}

function Get-Secret {
	[CmdletBinding()]
	param (
		[string]$Name,
		[string]$VaultName,
		[hashtable]$AdditionalParameters
	)
	try {
		# Suppress ActiveDirectory not found error
		return (Get-ADComputer -Properties ms-mcs-admpwd -Identity $Name | select -ExpandProperty ms-mcs-admpwd)
	} catch {}
}

function Remove-Secret {
	param (
		[string]$Name,
		[string]$VaultName,
		[hashtable] $AdditionalParameters
	)
	throw [System.NotImplementedException]"That doesn't make sense"
}

function Set-Secret {
	[CmdletBinding()]
	param (
		[string]$Name,
		[object]$Secret,
		[string]$VaultName,
		[hashtable]$AdditionalParameters,
		[hashtable]$Metadata
	)
	throw [System.NotImplementedException]"That doesn't make sense"
}
