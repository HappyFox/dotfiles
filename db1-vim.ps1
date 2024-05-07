$job = ssh -L 6666:localhost:6666 baston@db-1 "/home/baston/.local/bin/nvim" --headless --listen localhost:6666 &

do{
    Write-Host "Wait for socket to come up."
    sleep 0.5
}until(Test-NetConnection "localhost" -Port 6666 -InformationLevel Quiet)

#Start-Sleep -Seconds 1.5
Start-Process neovide.exe    -ArgumentList "--remote-tcp=localhost:6666"  -NoNewWindow -Wait 
nvr --servername localhost:6666 -s --nostart --remote-send '<esc>:qa!<cr>'
Wait-Job -Job $job
Remove-Job -Job $job
