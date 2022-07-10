Describe 'Get-Secret' {
	BeforeAll {
		Get-Module Microsoft.PowerShell.SecretManagement | Remove-Module -Force

		Register-SecretVault -ModuleName secretmanagement.laps -Name laps -AllowClobber

		$testcomputername = 'lapstest' + (Get-Random -Maximum 999999)
		$testpassword = 'PASSWORD1'
		$computer = New-ADComputer $testcomputername -PassThru
		$computer.'ms-Mcs-AdmPwd' = $testpassword
		Set-ADComputer -Instance $computer
	}

	It 'Gets a secret' {
		Get-Secret $testcomputername -AsPlainText | Should -Be $testpassword
	}
	
	AfterAll {
		Remove-ADComputer $testcomputername -Confirm:$false
	}
}
