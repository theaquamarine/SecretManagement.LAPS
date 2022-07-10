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
	$searcher = [adsisearcher]"(&(ms-mcs-admpwd=*)(name=$filter))"
	$searcher.FindAll() |
	ForEach-Object {
		$exptime = if ($_.Properties.'ms-mcs-admpwdexpirationtime') {
			$_.Properties.'ms-mcs-admpwdexpirationtime' | Select-Object -First 1
		} else {$null}
		return @(, [Microsoft.PowerShell.SecretManagement.SecretInformation]::new(
				$_.Properties.name,
				"String",
				$VaultName,
				@{'ExpirationTime' = ([datetime]::FromFileTime($exptime)).ToLocalTime()
				}
			))
	}
}

function Get-Secret {
	[CmdletBinding()]
	param (
		[string]$Name,
		[string]$VaultName,
		[hashtable]$AdditionalParameters
	)
	$searcher = [adsisearcher]"(&(ms-mcs-admpwd=*)(name=$Name))"
	$searcher.FindAll() | ForEach-Object {$_.Properties.'ms-mcs-admpwd'}
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
