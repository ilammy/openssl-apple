#!/usr/bin/env bash
#
# Update package spec files of Cossack Labs' OpenSSL.
#
#     scripts/update-specs.sh
#
# Run this after packaging OpenSSL with "scripts/create-packages.sh".
#
# Environment variables:
#
#     OUTPUT        output directory            (default: output)
#     MIN_IOS_SDK   minimum iOS SDK version     (default: 8.0)
#     MIN_OSX_SDK   minimum macOS SDK version   (default: 10.9)

set -eu

OUTPUT=${OUTPUT:-output}
MIN_IOS_SDK=${MIN_IOS_SDK:-8.0}
MIN_OSX_SDK=${MIN_OSX_SDK:-10.9}

# GitHub repository where build script and binaries are hosted
GITHUB_REPO="https://github.com/cossacklabs/openssl-apple"

die() {
    echo 2>&1 "$@"
    exit 1
}

if [[ ! -f "$OUTPUT/version" ]]
then
    die 'No package version. Run "scripts/create-packages.sh" first.'
fi

version="$(cat "$OUTPUT/version")"

# Carthage
for package in "$OUTPUT"/openssl-*.zip
do
    package="$(basename "$package")"
    spec="carthage/${package%%.zip}.json"
    if grep -q "\"$version\"" "$spec"
    then
        echo "OpenSSL $version is already present in $spec"
    else
        (
            head -1 "$spec" 2> /dev/null || echo "{"
            echo "    \"$version\": \"$GITHUB_REPO/releases/download/v$version/$package\","
            tail +2 "$spec" 2> /dev/null || echo "}"
        ) > "$OUTPUT/tmp.spec"
        mv "$OUTPUT/tmp.spec" "$spec"
    fi
done
echo "Updated carthage/*.json"
echo

# CocoaPods does not support static frameworks and use only dynamic ones.
podspec="cocoapods/CLOpenSSL.podspec"
iphone_archive="openssl-dynamic-iPhone.zip"
macosx_archive="openssl-dynamic-MacOSX.zip"
sed -e "s/%%OPENSSL_VERSION%%/$version/g" \
    -e "s!%%GITHUB_REPO%%!$GITHUB_REPO!g" \
    -e "s/%%MIN_IOS_SDK%%/$MIN_IOS_SDK/g" \
    -e "s/%%MIN_OSX_SDK%%/$MIN_OSX_SDK/g" \
    -e "s/%%IPHONE_ARCHIVE_NAME%%/$iphone_archive/g" \
    -e "s/%%IPHONE_ARCHIVE_HASH%%/$(shasum -a 256 "$OUTPUT/$iphone_archive" | awk '{print $1}')/g" \
    -e "s/%%MACOSX_ARCHIVE_NAME%%/$macosx_archive/g" \
    -e "s/%%MACOSX_ARCHIVE_HASH%%/$(shasum -a 256 "$OUTPUT/$macosx_archive" | awk '{print $1}')/g" \
    $podspec.template > $podspec
echo "Updated $podspec"
echo
