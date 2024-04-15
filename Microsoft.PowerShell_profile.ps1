oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\atomic.omp.json" | Invoke-Expression


function nvim
{
    $env:NVIM_LISTEN_ADDRESS = "\\.\pipe\nvim-nvr"
    nvr.exe -s --nostart --servername "$env:NVIM_LISTEN_ADDRESS" -cc NeovideFocus -l $args; 
    if ($LastExitCode -ne 0) { 
            neovide -- --listen "$env:NVIM_LISTEN_ADDRESS" ; 
            if ($args) 
            { 
                    nvr.exe -s --nostart --servername "$env:NVIM_LISTEN_ADDRESS" -cc NeovideFocus -l $args 
                    while ($LastExitCode -ne 0) {
                            nvr.exe -s --nostart --servername "$env:NVIM_LISTEN_ADDRESS" -cc NeovideFocus -l $args 
                    }
            } 
    } 
}

set-item -path alias:vi -value nvim
#$env:Path = "C:\Users\baston\AppData\Local\Programs\Python\Python312\Scripts;C:\Users\baston\AppData\Local\Programs\Python\Python312;$env:Path"

#$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

