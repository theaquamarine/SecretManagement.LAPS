@{

	# Script module or binary module file associated with this manifest.
	# RootModule        = 'SecretManagement.LAPS.psm1'

	# Version number of this module.
	ModuleVersion     = '0.0.1'

	# ID used to uniquely identify this module
	GUID              = 'dc1adf2e-3a6c-484d-bb90-7fef6f789552'

	# Author of this module
	Author            = 'blue'

	# Copyright statement for this module
	Copyright         = '(c) blue. All rights reserved.'

	# Description of the functionality provided by this module
	Description       = 'SecretManagement extension for Microsoft''s Local Administrator Password Solution'

	FunctionsToExport = @()
	CmdletsToExport   = @()
	VariablesToExport = @()
	AliasesToExport   = @()
	NestedModules     = @('.\SecretManagement.LAPS.Extension')
	PrivateData       = @{

		PSData = @{

			Prerelease = ''
			# Tags applied to this module. These help with module discovery in online galleries.
			Tags       = @('SecretManagement')

			# A URL to the license for this module.
			# LicenseUri = ''

			# A URL to the main website for this project.
			# ProjectUri = ''

			# A URL to an icon representing this module.
			# IconUri = ''

			# ReleaseNotes of this module
			# ReleaseNotes = ''

			# Prerelease string of this module
			# Prerelease = ''

			# Flag to indicate whether the module requires explicit user acceptance for install/update/save
			# RequireLicenseAcceptance = $false

			# External dependent modules of this module
			# ExternalModuleDependencies = @()

		} # End of PSData hashtable

	} # End of PrivateData hashtable

	# HelpInfo URI of this module
	# HelpInfoURI = ''

	# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
	# DefaultCommandPrefix = ''

}
