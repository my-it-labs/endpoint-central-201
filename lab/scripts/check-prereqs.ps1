# Comprobaciones del host Windows (laboratorio Endpoint Central)
# Ejecutar en PowerShell:  .\scripts\check-prereqs.ps1

$ErrorActionPreference = "Continue"
Write-Host "=== Comprobaciones del host (laboratorio Endpoint Central) ===" -ForegroundColor Cyan

function Test-Command($name) {
    if (Get-Command $name -ErrorAction SilentlyContinue) {
        return $true
    }
    Write-Host "Falta en PATH: $name" -ForegroundColor Red
    return $false
}

$ok = $true
$ok = (Test-Command "vagrant") -and $ok
$ok = (Test-Command "VBoxManage") -and $ok

if (Test-Command "vagrant") {
    Write-Host "Vagrant: $(vagrant --version)"
}
if (Test-Command "VBoxManage") {
    Write-Host "VirtualBox: $(VBoxManage --version)"
}

$plugins = vagrant plugin list 2>$null
if ($plugins -match "vagrant-vbguest") {
    Write-Host "Plugin vagrant-vbguest: instalado"
} else {
    Write-Host "Aviso: instala el plugin con: vagrant plugin install vagrant-vbguest" -ForegroundColor Yellow
}

$cs = Get-CimInstance Win32_ComputerSystem
$ramGb = [math]::Round($cs.TotalPhysicalMemory / 1GB)
Write-Host "RAM total (aprox): $ramGb GB"
if ($ramGb -lt 16) {
    Write-Host "Aviso: con menos de 16 GB el lab (6+4 GB en VMs + Windows) ira justo." -ForegroundColor Yellow
}

$drive = (Get-Location).Drive.Name
$disk = Get-PSDrive $drive
Write-Host "Disco libre en ${drive}: $([math]::Round($disk.Free / 1GB)) GB (unidad actual)"

$hv = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -ErrorAction SilentlyContinue
if ($hv -and $hv.State -eq "Enabled") {
    Write-Host "Aviso: Hyper-V esta activo. VirtualBox puede fallar o ir lento; desactiva Hyper-V o usa solo VirtualBox segun politica IT." -ForegroundColor Yellow
}

Write-Host ""
if ($ok) {
    Write-Host "=== Listo. Siguiente: vagrant up (desde la carpeta lab\) ===" -ForegroundColor Green
} else {
    Write-Host "Instala VirtualBox y Vagrant y vuelve a ejecutar este script." -ForegroundColor Red
    exit 1
}
