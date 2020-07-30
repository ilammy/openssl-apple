Pod::Spec.new do |s|
    # These parts of the spec are filled in by the template generator.
    openssl_version = "1.0.221"
    min_target_ios  = "8.0"
    min_target_osx  = "10.9"

    github_repo = "https://github.com/cossacklabs/openssl-apple"
    iPhone_archive_name = "openssl-dynamic-iPhone.zip"
    iPhone_archive_hash = "57e58986bf481056e1bcd024dff0b08dd7a81f916eeac76564daf089b38e9ff0"
    macOSX_archive_name = "openssl-dynamic-MacOSX.zip"
    macOSX_archive_hash = "059c45588683b4474134ebbba83f02ff95de63ad786d09f579a4fee31756a719"

    # Project metadata
    s.name     = "CLOpenSSL"
    s.version  = "#{openssl_version}"
    s.summary  = "Robust, commercial-grade, and full-featured toolkit for the TLS and SSL protocols as well as a general-purpose cryptography library."
    s.homepage = "https://www.openssl.org/"
    s.authors  = [
        "Andy Polyakov",
        "Ben Laurie",
        "Ben Kaduk",
        "Bernd Edlinger",
        "Bodo Möller",
        "David Benjamin",
        "Emilia Käsper",
        "Eric Young",
        "Geoff Thorpe",
        "Holger Reif",
        "Kurt Roeckx",
        "Lutz Jänicke",
        "Mark J. Cox",
        "Matt Caswell",
        "Matthias St. Pierre",
        "Nils Larsch",
        "Paul Dale",
        "Paul C. Sutton",
        "Ralf S. Engelschall",
        "Rich Salz",
        "Richard Levitte",
        "Stephen Henson",
        "Steve Marquess",
        "Tim Hudson",
        "Ulf Möller",
        "Viktor Dukhovni",
    ]

    # Source code location. Actually, this is the script that builds OpenSSL
    # after downloading its source tarball from the official site.
    s.source  = { :git => "#{github_repo}.git", :tag => "v#{openssl_version}" }
    s.license = {
        :type => "OpenSSL/SSLeay",
        :text => <<~EOF

        LICENSE ISSUES
        ==============

        The OpenSSL toolkit stays under a double license, i.e. both the conditions of
        the OpenSSL License and the original SSLeay license apply to the toolkit.
        See below for the actual license texts.

        OpenSSL License
        ---------------

      /* ====================================================================
       * Copyright (c) 1998-2019 The OpenSSL Project.  All rights reserved.
       *
       * Redistribution and use in source and binary forms, with or without
       * modification, are permitted provided that the following conditions
       * are met:
       *
       * 1. Redistributions of source code must retain the above copyright
       *    notice, this list of conditions and the following disclaimer.
       *
       * 2. Redistributions in binary form must reproduce the above copyright
       *    notice, this list of conditions and the following disclaimer in
       *    the documentation and/or other materials provided with the
       *    distribution.
       *
       * 3. All advertising materials mentioning features or use of this
       *    software must display the following acknowledgment:
       *    "This product includes software developed by the OpenSSL Project
       *    for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
       *
       * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
       *    endorse or promote products derived from this software without
       *    prior written permission. For written permission, please contact
       *    openssl-core@openssl.org.
       *
       * 5. Products derived from this software may not be called "OpenSSL"
       *    nor may "OpenSSL" appear in their names without prior written
       *    permission of the OpenSSL Project.
       *
       * 6. Redistributions of any form whatsoever must retain the following
       *    acknowledgment:
       *    "This product includes software developed by the OpenSSL Project
       *    for use in the OpenSSL Toolkit (http://www.openssl.org/)"
       *
       * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
       * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
       * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
       * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
       * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
       * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
       * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
       * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
       * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
       * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
       * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
       * OF THE POSSIBILITY OF SUCH DAMAGE.
       * ====================================================================
       *
       * This product includes cryptographic software written by Eric Young
       * (eay@cryptsoft.com).  This product includes software written by Tim
       * Hudson (tjh@cryptsoft.com).
       *
       */

       Original SSLeay License
       -----------------------

      /* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
       * All rights reserved.
       *
       * This package is an SSL implementation written
       * by Eric Young (eay@cryptsoft.com).
       * The implementation was written so as to conform with Netscapes SSL.
       *
       * This library is free for commercial and non-commercial use as long as
       * the following conditions are aheared to.  The following conditions
       * apply to all code found in this distribution, be it the RC4, RSA,
       * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
       * included with this distribution is covered by the same copyright terms
       * except that the holder is Tim Hudson (tjh@cryptsoft.com).
       *
       * Copyright remains Eric Young's, and as such any Copyright notices in
       * the code are not to be removed.
       * If this package is used in a product, Eric Young should be given attribution
       * as the author of the parts of the library used.
       * This can be in the form of a textual message at program startup or
       * in documentation (online or textual) provided with the package.
       *
       * Redistribution and use in source and binary forms, with or without
       * modification, are permitted provided that the following conditions
       * are met:
       * 1. Redistributions of source code must retain the copyright
       *    notice, this list of conditions and the following disclaimer.
       * 2. Redistributions in binary form must reproduce the above copyright
       *    notice, this list of conditions and the following disclaimer in the
       *    documentation and/or other materials provided with the distribution.
       * 3. All advertising materials mentioning features or use of this software
       *    must display the following acknowledgement:
       *    "This product includes cryptographic software written by
       *     Eric Young (eay@cryptsoft.com)"
       *    The word 'cryptographic' can be left out if the rouines from the library
       *    being used are not cryptographic related :-).
       * 4. If you include any Windows specific code (or a derivative thereof) from
       *    the apps directory (application code) you must include an acknowledgement:
       *    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
       *
       * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
       * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
       * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
       * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
       * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
       * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
       * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
       * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
       * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
       * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
       * SUCH DAMAGE.
       *
       * The licence and distribution terms for any publically available version or
       * derivative of this code cannot be changed.  i.e. this code cannot simply be
       * copied and put under another distribution licence
       * [including the GNU Public Licence.]
       */
EOF
    }

    # This is where all the action happens. Since OpenSSL is so huge and building it
    # properly is so painful to setup, "pod install" will download prebuilt binaries
    # that we publish elsewhere (not in the git repo with the build script code).
    s.prepare_command = <<-EOF
        echo "Downloading prebuilt framework for iOS..."
        curl --location --output iPhone.zip \
            "#{github_repo}/releases/download/v#{openssl_version}/#{iPhone_archive_name}"
        echo "Verifying #{iPhone_archive_name}..."
        if [ "$(shasum -a 256 iPhone.zip | awk '{print $1}')" != "#{iPhone_archive_hash}" ]
        then
            echo "checksum mismatch for #{iPhone_archive_name}"
            exit 1
        fi
        echo "Unpacking #{iPhone_archive_name}..."
        unzip iPhone.zip
        mkdir -p iPhone
        mv openssl.framework iPhone/
        rm iPhone.zip

        echo "Downloading prebuilt framework for macOS..."
        curl --location --output macOSX.zip \
            "#{github_repo}/releases/download/v#{openssl_version}/#{macOSX_archive_name}"
        echo "Verifying #{macOSX_archive_name}..."
        if [ "$(shasum -a 256 macOSX.zip | awk '{print $1}')" != "#{macOSX_archive_hash}" ]
        then
            echo "checksum mismatch for #{macOSX_archive_name}"
            exit 1
        fi
        echo "Unpacking #{macOSX_archive_name}..."
        unzip macOSX.zip
        mkdir -p macOSX
        mv openssl.framework macOSX/
        rm macOSX.zip
    EOF

    # This pod does not build any source code, it reuses prebuilt framework.
    # However, we still need to specify the minimum target platform versions
    # for CocoaPods to generate the Xcode project properly.
    s.ios.deployment_target   = "#{min_target_ios}"
    s.ios.vendored_frameworks = "iPhone/openssl.framework"
    s.osx.deployment_target   = "#{min_target_osx}"
    s.osx.vendored_frameworks = "macOSX/openssl.framework"
end
