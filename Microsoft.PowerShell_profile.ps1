oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\atomic.omp.json" | Invoke-Expression


function nix_vim
{

    $job = ssh -L 6666:localhost:6666 baston@db-1 "/home/baston/.local/bin/nvim" --headless --listen localhost:6666 &
    Start-Process neovide.exe    -ArgumentList "--remote-tcp=localhost:6666"  -NoNewWindow -Wait 
    Stop-Job -Job $job
    Remove-Job -Job $job

}

function nix_neovide{
    neovide.exe --remote-tcp=localhost:6666 
}

function nvim2
{
    $env:NVIM_LISTEN_ADDRESS = "\\.\pipe\nvim-nvr"
    if($args){
            nvr.exe -s --nostart --servername "$env:NVIM_LISTEN_ADDRESS" -cc NeovideFocus -l $args; 
    }
    else{
            nvr.exe -s --nostart --servername "$env:NVIM_LISTEN_ADDRESS" -cc NeovideFocus
    }

    if ($LastExitCode -ne 0) { 
            neovide --wsl -- --listen "$env:NVIM_LISTEN_ADDRESS" ; 
            if ($args) 
            { 
                    nvr.exe -s --nostart --servername "$env:NVIM_LISTEN_ADDRESS" -cc NeovideFocus -l $args 
                    while ($LastExitCode -ne 0) {
                            nvr.exe -s --nostart --servername "$env:NVIM_LISTEN_ADDRESS" -cc NeovideFocus -l $args 
                    }
            } 
    } 
}

set-item -path alias:vi -value nvim2


function make-link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

#$env:Path = "C:\Users\baston\AppData\Local\Programs\Python\Python312\Scripts;C:\Users\baston\AppData\Local\Programs\Python\Python312;$env:Path"

#$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")


#34de4b3d-13a8-4540-b76d-b9e8d3851756 PowerToys CommandNotFound module

Import-Module "C:\Program Files\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
#34de4b3d-13a8-4540-b76d-b9e8d3851756
