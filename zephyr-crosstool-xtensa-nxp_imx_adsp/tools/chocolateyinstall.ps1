$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/stephanosio/zephyr-crosstool-ng/releases/download/zephyr-crosstool-ng-1.24.0.3/zephyr-crosstool-ng-1.24.0.3_windows-x86_64_xtensa-nxp_imx_adsp_zephyr-elf.zip'
$archiveDir = "zephyr-crosstool-ng-1.24.0.3"

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  url64bit        = $url64
  checksum64      = 'D905587E2654568957D74785418044C30F383204EFE7C00A56FDA271B1EB1C40'
  checksumType64  = 'sha256'
}

# Download and unzip the source package
Install-ChocolateyZipPackage @packageArgs

# Relocate files out of archive subdirectories
# HACK: Because Chocolatey PowerShell does not like long paths ...
cmd /c "xcopy `"$toolsDir\$archiveDir\xtensa-nxp_imx_adsp_zephyr-elf\*`" `"$toolsDir`" /s /e /i /y /q"
cmd /c "rmdir /s /q `"$toolsDir\$archiveDir`""
