Write-Host "Starting IronFoundry for .NET Services"

sc.exe start IFDeaDirSvc | Out-Null
Write-Host "IFDeaDirSvc: " -NoNewline
sc.exe query IFDeaDirSvc | select-string 'STATE' | %{ $status = $_ -match "(\:\s\d*\s)(.*)"; if ($status) { $matches[2].Trim() } }

sc.exe start ironfoundry.warden | Out-Null
Write-Host "ironfoundry.warden: " -NoNewline
sc.exe query ironfoundry.warden | select-string 'STATE' | %{ $status = $_ -match "(\:\s\d*\s)(.*)"; if ($status) { $matches[2].Trim() } }

sc.exe start IFDeaSvc | Out-Null
Write-Host "IFDeaSvc: " -NoNewline
sc.exe query IFDeaSvc | select-string 'STATE' | %{ $status = $_ -match "(\:\s\d*\s)(.*)"; if ($status) { $matches[2].Trim() } }
