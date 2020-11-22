#!/usr/bin/env bash
#
# Create packages of Cossack Labs' OpenSSL.
#
#     scripts/create-packages.sh
#
# Run this after building OpenSSL with "./build-libssl.sh".
#
# Environment variables:
#
#     OUTPUT        output directory            (default: output)
#     FLAVORS       package flavors to build    (default: static dynamic)

set -eu

OUTPUT=${OUTPUT:-output}
FLAVORS=${FLAVORS:-static dynamic}

die() {
    echo 2>&1 "$@"
    exit 1
}

if [[ ! -f create-openssl-framework.sh ]]
then
    die 'Please run "scripts/create-package.sh" from repository root.'
fi

if [[ ! -d lib ]]
then
    die 'No OpenSSL binaries. Please run "./build-libssl.sh" first.'
fi

# Print framework bundle version (CFBundleShortVersionString property).
framework_version() {
    local fmwk="$1"
    # Info.plist may be located in different places depending on the target OS.
    local info_plist="$(find "$fmwk" -type f -name Info.plist)"
    # It's not that well-known, but it's a standard utility after all.
    # "plutil" is not very convenient for extracting individual values.
    /usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$info_plist"
}

mkdir -p "$OUTPUT"

for flavor in $FLAVORS
do
    ./create-openssl-framework.sh $flavor

    echo "Packaging $flavor XCFramework"

    # zip stores relative paths, cd into directory to keep them tidy.
    # Is also important to preserve symlinks for macOS frameworks.
    cd frameworks
    zip --recurse-paths --symlinks --quiet \
        openssl.zip openssl.xcframework
    cd "$OLDPWD"

    mv frameworks/openssl.zip \
        "$OUTPUT/openssl-$flavor-xcframework.zip"

    # Use macOS framework as a reference for versioning.
    # (They are all the same, but we need non-XCFramework).
    framework_version frameworks/MacOSX/openssl.framework \
        > "$OUTPUT/version"

    echo "Packaged $flavor XCFramework"
done
