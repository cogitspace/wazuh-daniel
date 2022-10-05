Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.8-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.8.msi; msiexec.exe /i ${env:tmp}\wazuh-agent-4.3.8.msi /q WAZUH_MANAGER='127.0.0.1' WAZUH_REGISTRATION_SERVER='127.0.0.1' 
Start-Sleep -Second 20
NET START WazuhSvc
