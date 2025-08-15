$msg = Read-Host "Enter commit message"
if ([string]::IsNullOrWhiteSpace($msg)) {
    Write-Host "No commit message entered. Aborting."
    exit 1
}
git add .
git commit -m $msg
git push
