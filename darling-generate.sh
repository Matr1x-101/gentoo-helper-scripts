# Copyright (C) 2026 Abishek Jakkala
# This file is part of Gentoo helper scripts <https://github.com/Matr1x-101/gentoo-helper-scripts>
#
# Gentoo helper scripts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Gentoo helper scripts is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Gentoo helper scripts.  If not, see <http://www.gnu.org/licenses/>.

#!/bin/bash

PREFIX="https://github.com/darlinghq/"

declare -a versions=(
	"2.2.9"
	"2.5.5"
	"2.6.5"
	"2.8.3"
)

for (( i=0; i<${#versions[@]}; i++ ));
do
	echo "	${PREFIX}darling-libressl/archive/$(git ls-remote https://github.com/darlinghq/darling-libressl refs/heads/v${versions[$i]} | sed "s/\srefs.*//g").tar.gz -> darling-libressl-v${versions[$i]}.tar.gz"
done



declare -a contents=(
	'cctools-port'
	'darling-adv_cmds'
	'darling-apr'
	'darling-architecture'
	'darling-AvailabilityVersions'
	'darling-awk'
	'darling-bash'
	'darling-basic_cmds'
	'darling-bc'
	'darling-BerkeleyDB'
	'darling-bind9'
	'darling-bmalloc'
	'darling-bootstrap_cmds'
	'darling-bsm'
	'darling-bzip2'
	'darling-cctools'
	'darling-cfnetwork'
	'darling-cocotron'
	'darling-commoncrypto'
	'darling-compiler-rt'
	'darling-configd'
	'darling-copyfile'
	'darling-corecrypto'
	'darling-corefoundation'
	'darling-coretls'
	'darling-crontabs'
	'darling-Csu'
	'darling-cups'
	'darling-curl'
	'darling-dbuskit'
	'darling-DirectoryService'
	'darling-dmg'
	'darling-doc_cmds'
	'darling-DSTools'
	'darling-dtrace'
	'darling-dyld'
	'darling-energytrace'
	'darling-expat'
	'darling-file_cmds'
	'darling-file'
	'darling-files'
	'darling-foundation'
	'darling-glut'
	'darling-gnudiff'
	'darling-gnutar'
	'darling-gpatch'
	'darling-grep'
	'darling-groff'
	'darling-Heimdal'
	'darling-icu'
	'darling-installer'
	'darling-IOGraphics'
	'darling-IOHIDFamily'
	'darling-iokitd'
	'darling-IOKitTools'
	'darling-iokituser'
	'darling-IONetworkingFamily'
	'darling-iostoragefamily'
	'darling-JavaScriptCore'
	'darling-keymgr'
	'darling-less'
	'darling-libarchive'
	'darling-libauto'
	'darling-Libc'
	'darling-libclosure'
	'darling-libcxx'
	'darling-libcxxabi'
	'darling-libdispatch'
	'darling-libedit'
	'darling-libffi'
	'darling-libiconv'
	'darling-Libinfo'
	'darling-libkqueue'
	'darling-liblzma'
	'darling-libmalloc'
	'darling-libnetwork'
	'darling-Libnotify'
	'darling-libplatform'
	'darling-libpthread'
	'darling-libresolv'
	'darling-librpcsvc'
	'darling-libstdcxx'
	'darling-Libsystem'
	'darling-libtelnet'
	'darling-libtrace'
	'darling-libunwind'
	'darling-libutil'
	'darling-libxml2'
	'darling-libxpc'
	'darling-libxslt'
	'darling-mail_cmds'
	'darling-man'
	'darling-mDNSResponder'
	'darling-metal'
	'darling-misc_cmds'
	'darling-MITKerberosShim'
	'darling-nano'
	'darling-ncurses'
	'darling-netcat'
	'darling-network_cmds'
	'darling-nghttp2'
	'darling-objc4'
	'darling-openal'
	'darling-opendirectory'
	'darling-openjdk'
	'darling-OpenLDAP'
	'darling-openpam'
	'darling-openssh'
	'darling-openssl_certificates'
	'darling-openssl'
	'darling-pam_modules'
	'darling-passwordserver_sasl'
	'darling-patch_cmds'
	'darling-pcre'
	'darling-perl'
	'darling-pyobjc'
	'darling-python_modules'
	'darling-python'
	'darling-remote_cmds'
	'darling-removefile'
	'darling-rsync'
	'darling-ruby'
	'darling-screen'
	'darling-security'
	'darling-SecurityTokend'
	'darling-shell_cmds'
	'darling-SmartCardServices'
	'darling-sqlite'
	'darling-swift'
	'darling-swift-corelibs-foundation'
	'darling-syslog'
	'darling-system_cmds'
	'darling-tcsh'
	'darling-text_cmds'
	'darling-TextEdit'
	'darling-top'
	'darling-usertemplate'
	'darling-vim'
	'darling-WebCore'
	'darling-WTF'
	'darling-xar'
	'darling-xnu'
	'darling-zip'
	'darling-zlib'
	'darling-zsh'
	'darling'
	'darlingserver'
	'fmdb'
	'indium'
	'lzfse'
	'xcbuild'
)

for (( i=0; i<${#contents[@]}; i++ ));
do
	echo "	mv \"\${WORKDIR}/${contents[$i]}-$(git ls-remote "${PREFIX}${contents[$i]}" HEAD)\" \"\${S}/src/external/${contents[$i]}\" || die" \
        | sed 's/[[:space:]]\+HEAD//'
done

for (( i=0; i<${#contents[@]}; i++ ));
do
	echo "	${PREFIX}${contents[$i]}/archive/$(git ls-remote "${PREFIX}${contents[$i]}" HEAD).tar.gz -> ${contents[$i]}.tar.gz" \
        | sed 's/[[:space:]]\+HEAD//'
done
