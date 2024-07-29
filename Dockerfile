FROM mcr.microsoft.com/windows/server:ltsc2022

WORKDIR /scripts

COPY download_updates.ps1 .

ENTRYPOINT ["powershell.exe", "-File", "download_updates.ps1"]
