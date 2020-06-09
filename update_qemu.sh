#!/bin/bash

set -e
pushd $(dirname $0) > /dev/null

# Validate arguments
if [[ -z "$1" ]]; then
  echo "${0} [version]"
  exit 1
fi

VERSION="$1"
SOURCE=${SOURCE:-"https://github.com/stephanosio/zephyr-qemu/releases/download/zephyr-qemu-v${VERSION}"}

# Prompt user confirmation
echo "Source  = ${SOURCE}"
echo "Version = ${VERSION}"
echo

read -p "Do you want to proceed with updating 'zephyr-qemu' package? [y/n] " -n 1 -r
echo
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 2
fi

# Process packages
mkdir -p source

# Download source file
SOURCE_URL="${SOURCE}/zephyr-qemu-v${VERSION}_windows-x86_64.zip"
SOURCE_FILE="source/zephyr-qemu-v${VERSION}.zip"

if [ ! -f "${SOURCE_FILE}" ]; then
echo "  Downloading source file ..."
curl -f -# -L "${SOURCE_URL}" -o "${SOURCE_FILE}.tmp"
mv -f "${SOURCE_FILE}.tmp" "${SOURCE_FILE}"
fi

# Compute source file hash
echo "  Computing source file hash ..."
SOURCE_HASH=$(sha256sum "${SOURCE_FILE}" | awk '{print $1}')
echo "    ${SOURCE_HASH}"

# Resolve package information
RELNOTE_URL="https://github.com/stephanosio/zephyr-qemu/releases/tag/zephyr-qemu-v${VERSION}"

# Update nuspec
NUSPEC_FILE="zephyr-qemu/zephyr-qemu.nuspec"

echo "  Updating nuspec ... "
sed -i -e "s#<version>.*</version>#<version>${VERSION}</version>#g" "${NUSPEC_FILE}"
sed -i -e "s#<releaseNotes>.*</releaseNotes>#<releaseNotes>${RELNOTE_URL}</releaseNotes>#g" "${NUSPEC_FILE}"

# Update install script
INST_SCRIPT_FILE="zephyr-qemu/tools/chocolateyinstall.ps1"

echo "  Updating install script ... "
sed -i -e "s#\$url64\([ tab]*\)=\([ tab]*\)'.*'#\$url64\1=\2'${SOURCE_URL}'#g" "${INST_SCRIPT_FILE}"
sed -i -e "s#\$archiveDir\([ tab]*\)=\([ tab]*\)\".*\"#\$archiveDir\1=\2\"zephyr-qemu-v${VERSION}\"#g" "${INST_SCRIPT_FILE}"
sed -i -e "s#checksum64\([ tab]*\)=\([ tab]*\)'.*'#checksum64\1=\2'${SOURCE_HASH}'#g" "${INST_SCRIPT_FILE}"

popd > /dev/null
