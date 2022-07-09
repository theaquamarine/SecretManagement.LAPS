@{
	RootModule        = 'SecretManagement.LAPS.Extension.psm1'
	ModuleVersion     = '0.0.1'
	GUID              = 'c2020087-4bac-449a-81f6-3eb4841853f0'
	Author            = 'blue'
	FunctionsToExport = 'Test-SecretVault', 'Get-SecretInfo', 'Get-Secret', 'Set-Secret', 'Remove-Secret'
	CmdletsToExport   = @()
	VariablesToExport = @()
	AliasesToExport   = @()
	RequiredModules   = @(
		@{ModuleName = 'ActiveDirectory'; ModuleVersion = '0.0'}
	)
}
