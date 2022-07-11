# SecretManagement.LAPS

SecretManagement extension for Microsoft's Local Administrator Password Solution

## Usage

```
Install-Module SecretManagement.LAPS
Register-SecretVault -ModuleName SecretManagement.LAPS -Name LAPS
Get-Secret -Vault LAPS -Name mycomputer -AsPlainText
```

## Todo

- Resetting (and setting?) passwords
- Use a specific domain
- Non-Windows support
