﻿$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64      = 'https://github.com/stephanosio/zephyr-crosstool-ng/releases/download/zephyr-crosstool-ng-1.24.0.4/zephyr-crosstool-ng-1.24.0.4_windows-x86_64_x86_64-zephyr-elf.zip'
$archiveDir = "zephyr-crosstool-ng-1.24.0.4"

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  url64bit        = $url64
  checksum64      = 'baf7ccedf5e6b8abe6564ce8071ca01c6611cc738c828fe497b61421d21ed903'
  checksumType64  = 'sha256'
}

# Download and unzip the source package
Install-ChocolateyZipPackage @packageArgs

# Relocate files out of archive subdirectories
# HACK: Because Chocolatey PowerShell does not like long paths ...
cmd /c "xcopy `"$toolsDir\$archiveDir\x86_64-zephyr-elf\*`" `"$toolsDir`" /s /e /i /y /q"
cmd /c "rmdir /s /q `"$toolsDir\$archiveDir`""
