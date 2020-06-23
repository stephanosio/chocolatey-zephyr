$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/stephanosio/zephyr-crosstool-ng/releases/download/zephyr-crosstool-ng-1.24.0.4/zephyr-crosstool-ng-1.24.0.4_windows-x86_64_xtensa-intel_apl_adsp_zephyr-elf.zip'
$archiveDir = "zephyr-crosstool-ng-1.24.0.4"

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  url64bit        = $url64
  checksum64      = '902ced2e4d09ea160b12e617e671c03689270b69728ec88d5673f5dfd79e41ca'
  checksumType64  = 'sha256'
}

# Download and unzip the source package
Install-ChocolateyZipPackage @packageArgs

# Relocate files out of archive subdirectories
# HACK: Because Chocolatey PowerShell does not like long paths ...
cmd /c "xcopy `"$toolsDir\$archiveDir\xtensa-intel_apl_adsp_zephyr-elf\*`" `"$toolsDir`" /s /e /i /y /q"
cmd /c "rmdir /s /q `"$toolsDir\$archiveDir`""
