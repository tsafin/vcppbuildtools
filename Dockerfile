FROM microsoft/windowsservercore

MAINTAINER Timur Safin

# Download and install it immediately

# RUN powershell -Command \
#	$ErrorActionPreference = 'Stop'; \
#	Invoke-WebRequest -Method Get -Uri http://nginx.org/download/nginx-1.9.13.zip -OutFile c:\nginx-1.9.13.zip ; \
#	Expand-Archive -Path c:\nginx-1.9.13.zip -DestinationPath c:\ ; \
#	Remove-Item c:\nginx-1.9.13.zip -Force


# I want it committed for a while

RUN mkdir c:\install

RUN powershell -Command \
	$ErrorActionPreference = 'Stop'; \
	Invoke-WebRequest -Uri "http://go.microsoft.com/fwlink/?LinkId=691126" -UseBasicParsing -OutFile c:\install\VisualCppBuildTools_Full.exe ; \
	Invoke-Command -ScriptBlock { c:\install\VisualCppBuildTools_Full.exe /full /NoRefresh /norestart /silent /passive } ; \
	Wait-Process -Name visualcppbuildtools_full

CMD "powershell.exe"