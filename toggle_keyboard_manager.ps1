$kbm = Get-Process PowerToys.KeyboardManagerEngine -ErrorAction SilentlyContinue

if ($kbm){
    Stop-Process -Name PowerToys.KeyboardManagerEngine
    New-BurntToastNotification -Text 'Powertoys Keyboard Manager DISABLED'
} else {
    Start-Process -FilePath 'C:\Program Files\PowerToys\KeyboardManagerEngine\PowerToys.KeyboardManagerEngine.exe'
    New-BurntToastNotification -Text 'Powertoys Keyboard Manager ENABLED'
}
