$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/stephanosio/zephyr-qemu/releases/download/zephyr-qemu-v5.0.0.1/zephyr-qemu-v5.0.0.1_windows-x86_64.zip'
$archiveDir = "zephyr-qemu-v5.0.0.1"

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  url64bit        = $url64
  checksum64      = '879197a26e8ea2e550c6393dc4299112571e09a32f450d4a9b8c5241300b7982'
  checksumType64  = 'sha256'
}

# Download and unzip the source package
Install-ChocolateyZipPackage @packageArgs

# Relocate files out of archive subdirectories
# HACK: Because Chocolatey PowerShell does not like long paths ...
cmd /c "xcopy `"$toolsDir\$archiveDir\*`" `"$toolsDir`" /s /e /i /y /q"
cmd /c "rmdir /s /q `"$toolsDir\$archiveDir`""
