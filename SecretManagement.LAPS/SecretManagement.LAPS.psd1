@{
	ModuleVersion     = '0.0.1'
	GUID              = 'dc1adf2e-3a6c-484d-bb90-7fef6f789552'
	Author            = 'blue'
	Copyright         = '(c) blue. All rights reserved.'
	Description       = 'SecretManagement extension for Microsoft''s Local Administrator Password Solution'

	FunctionsToExport = @()
	CmdletsToExport   = @()
	VariablesToExport = @()
	AliasesToExport   = @()
	NestedModules     = @('.\SecretManagement.LAPS.Extension')
	RequiredModules   = @(
		@{ModuleName = 'Microsoft.Powershell.SecretManagement'; ModuleVersion = '1.1.0'}
	)

	PrivateData       = @{
		PSData = @{
			Prerelease = ''
			Tags       = @('SecretManagement', 'LAPS', 'ActiveDirectory')
			LicenseUri = 'https://raw.githubusercontent.com/theaquamarine/SecretManagement.LAPS/main/LICENSE.md'
			ProjectUri = 'https://github.com/theaquamarine/SecretManagement.LAPS'
			# ReleaseNotes = ''
		} # End of PSData hashtable
	} # End of PrivateData hashtable

	# HelpInfo URI of this module
	# HelpInfoURI = ''
}
