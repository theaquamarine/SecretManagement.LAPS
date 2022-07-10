Describe 'Get-SecretInfo' {
	BeforeAll {
		Get-Module Microsoft.PowerShell.SecretManagement | Remove-Module -Force

		Register-SecretVault -ModuleName secretmanagement.laps -Name laps -AllowClobber

		$testcomputername = 'testcomputer'
		$testpassword = 'PASSWORD1'

		$computer = New-ADComputer $testcomputername -PassThru
		$computer.'ms-Mcs-AdmPwd' = $testpassword
		Set-ADComputer -Instance $computer
		$computer = New-ADComputer 'testcomputer2' -PassThru
		$computer.'ms-Mcs-AdmPwd' = $testpassword
		Set-ADComputer -Instance $computer
	}

	It 'Gets all secretinfo' {
		(Get-SecretInfo).Count | Should -BeGreaterOrEqual 2
	}
	It 'Gets a specific secretinfo' {
		Get-SecretInfo $testcomputername | Should -HaveCount 1
	}
	
	AfterAll {
		Remove-ADComputer $testcomputername -Confirm:$false
		Remove-ADComputer 'testcomputer2' -Confirm:$false
	}
}
