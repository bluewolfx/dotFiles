function Get-GitBranch {
    $branch = git branch --show-current 2>$null
    if ($branch) {
        return " git:($branch)"
    }
    return ""
}

function prompt {
    $path = $PWD.Path
    $gitBranch = Get-GitBranch
    Write-Host "$([char]0x256D)$([char]0x2500)" -NoNewline -ForegroundColor Green
    Write-Host "[" -NoNewline -ForegroundColor White
    Write-Host "$env:USERNAME" -NoNewline -ForegroundColor Cyan
    Write-Host "@" -NoNewline -ForegroundColor White
    Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
    Write-Host "]" -NoNewline -ForegroundColor White
    Write-Host " - " -NoNewline -ForegroundColor White
    Write-Host "[" -NoNewline -ForegroundColor White
    Write-Host "$path" -NoNewline -ForegroundColor Blue
    Write-Host "]" -NoNewline -ForegroundColor White
    Write-Host $gitBranch -ForegroundColor Yellow
    Write-Host "$([char]0x2570)$([char]0x2500)$([char]0x2500)>" -NoNewline -ForegroundColor Green
    return " "
}
