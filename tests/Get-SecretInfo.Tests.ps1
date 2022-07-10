Describe 'Get-SecretInfo' {
	BeforeAll {
		Get-Module Microsoft.PowerShell.SecretManagement | Remove-Module -Force

		Register-SecretVault -ModuleName secretmanagement.laps -Name laps -AllowClobber

		$testcomputername = 'lapstest' + (Get-Random -Maximum 999999)
		$testcomputername2 = 'lapstest' + (Get-Random -Maximum 999999)
		$testpassword = 'PASSWORD1'

		$computer = New-ADComputer $testcomputername -PassThru
		$computer.'ms-Mcs-AdmPwd' = $testpassword
		Set-ADComputer -Instance $computer
		$computer = New-ADComputer $testcomputername2 -PassThru
		$computer.'ms-Mcs-AdmPwd' = $testpassword
		Set-ADComputer -Instance $computer

		Reset-AdmPwdPassword -ComputerName $testcomputername
	}

	It 'Gets all secretinfo' {
		(Get-SecretInfo).Count | Should -BeGreaterOrEqual 2
	}

	It 'Gets a specific secretinfo' {
		Get-SecretInfo $testcomputername | Should -HaveCount 1
	}
	
	It 'Gets expiry times' {
		(Get-SecretInfo $testcomputername).Metadata.ExpirationTime | Should -BeOfType DateTime
	}
	
	It 'Gets correct expiry times' {
		(Get-SecretInfo $testcomputername).Metadata.ExpirationTime | 
			Should -Be (Get-AdmPwdPassword $testcomputername).ExpirationTimestamp
	}
	
	It 'Gets a sensible expiration time' {
		(Get-SecretInfo $testcomputername).Metadata.ExpirationTime.Year | Should -BeGreaterOrEqual 1000
	}
	
	AfterAll {
		Remove-ADComputer $testcomputername -Confirm:$false
		Remove-ADComputer $testcomputername2 -Confirm:$false
	}
}
