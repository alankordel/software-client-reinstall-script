# Script: ADMReinstall.ps1
# Autor: Alan Kordel
# Descrição: Script para reinstalação limpa do cliente ADM (ACME Device Manager) em máquinas Windows.
# Ambiente fictício: Contoso Corp

Write-Output "=== Iniciando reinstalação do cliente ADM ==="

# Parar serviços relacionados ao ADM
Write-Output "Parando serviços: AdmAgent e BITS..."
Stop-Service -Name AdmAgent -Force -ErrorAction SilentlyContinue
Stop-Service -Name BITS -Force -ErrorAction SilentlyContinue

# Remover pastas antigas do cliente
Write-Output "Removendo diretórios antigos do cliente..."
Remove-Item -Path "C:\Windows\ADM" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\admsetup" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\ADMCache" -Recurse -Force -ErrorAction SilentlyContinue

# Limpeza de chaves de registro do cliente ADM
Write-Output "Limpando entradas do Registro..."
Remove-Item -Path "HKLM:\SOFTWARE\ContosoCorp\ADM" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "HKLM:\SOFTWARE\ContosoCorp\ADMSetup" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "HKLM:\SOFTWARE\ContosoCorp\DeviceManager" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "HKLM:\SOFTWARE\ContosoCorp\SystemCertificates\ADM\Certificates" -Recurse -Force -ErrorAction SilentlyContinue

# Reinstalação do cliente ADM
Write-Output "Executando instalador do cliente ADM..."
Start-Process -FilePath "C:\Temp\admsetup.exe" `
    -ArgumentList "/mp:ADM-SERVER.CONTOSO.LOCAL ADMDEPLOYCODE=ABC FSP=ADM-SERVER.CONTOSO.LOCAL ADMPM=ADM-SERVER.CONTOSO.LOCAL /logon /skipprereq:None /forceinstall" `
    -Wait -NoNewWindow

# Aguardar término da instalação
Write-Output "Aguardando 60 segundos para conclusão da instalação..."
Start-Sleep -Seconds 60

# Reiniciar serviço AdmAgent
Write-Output "Reiniciando serviço AdmAgent..."
Start-Service -Name AdmAgent -ErrorAction SilentlyContinue

Write-Output "=== Reinstalação concluída com sucesso ==="