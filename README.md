# ADM Client Reinstall Script

Este repositório contém um script PowerShell criado para reinstalar de forma limpa o cliente ADM (ACME Device Manager), uma solução fictícia de gerenciamento de estações de trabalho corporativas, no contexto da empresa fictícia Contoso Corp.

## 🔧 Funcionalidades

- Interrompe serviços relacionados ao cliente ADM
- Remove diretórios e entradas de registro antigas
- Executa reinstalação do cliente com parâmetros customizados
- Reinicia os serviços após a instalação

## ▶️ Como usar

Execute o script em uma janela do PowerShell com permissões de administrador. Certifique-se de que o instalador `admsetup.exe` esteja no caminho `C:\Temp\`.

```powershell
.\ADMReinstall.ps1
```

## ✅ Requisitos

- PowerShell 5.1 ou superior
- Acesso como administrador local
- Instalador `admsetup.exe` disponível localmente

## ⚠️ Aviso

Este script é fictício e foi criado apenas para fins educacionais e como amostra de portfólio técnico. Adapte os caminhos e parâmetros conforme o ambiente real, caso use como base para automações corporativas.