Describe 'Test-SecretVault' {
	BeforeAll {
		Get-Module Microsoft.PowerShell.SecretManagement | Remove-Module -Force

		Register-SecretVault -ModuleName secretmanagement.laps -Name laps -AllowClobber
	}

	It 'Tests domain connectivity' {
		Test-SecretVault | Should -Be ([bool](Get-ADDomain))
	}
}
