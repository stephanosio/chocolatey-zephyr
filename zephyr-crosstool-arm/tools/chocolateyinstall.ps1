$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/stephanosio/zephyr-crosstool-ng/releases/download/zephyr-crosstool-ng-1.24.0.3/zephyr-crosstool-ng-1.24.0.3_windows-x86_64_arm-zephyr-eabi.zip'
$archiveDir = "zephyr-crosstool-ng-1.24.0.3"

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  url64bit        = $url64
  checksum64      = '7879AE8337E0D78EB6F4A361B89CA1EAED6F74F3DEAB67D97B617BFA77F5D733'
  checksumType64  = 'sha256'
}

# Download and unzip the source package
Install-ChocolateyZipPackage @packageArgs

# Relocate files out of archive subdirectories
# HACK: Because Chocolatey PowerShell does not like long paths ...
cmd /c "xcopy `"$toolsDir\$archiveDir\arm-zephyr-eabi\*`" `"$toolsDir`" /s /e /i /y /q"
cmd /c "rmdir /s /q `"$toolsDir\$archiveDir`""
