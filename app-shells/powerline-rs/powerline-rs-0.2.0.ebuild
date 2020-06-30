# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.0

EAPI=7

CRATES="
ansi_term-0.11.0
arrayref-0.3.5
arrayvec-0.4.12
atty-0.2.13
autocfg-0.1.7
backtrace-0.3.40
backtrace-sys-0.1.32
base64-0.10.1
bitflags-1.2.1
blake2b_simd-0.5.8
byteorder-1.3.2
cc-1.0.46
cfg-if-0.1.10
chrono-0.4.9
clap-2.33.0
cloudabi-0.0.3
constant_time_eq-0.1.4
crossbeam-utils-0.6.6
dirs-2.0.2
dirs-sys-0.3.4
failure-0.1.6
failure_derive-0.1.6
fuchsia-cprng-0.1.1
getrandom-0.1.12
git2-0.10.1
idna-0.2.0
jobserver-0.1.17
lazy_static-1.4.0
libc-0.2.65
libgit2-sys-0.9.1
libz-sys-1.0.25
log-0.4.8
matches-0.1.8
nodrop-0.1.14
num-integer-0.1.41
num-traits-0.2.8
num_cpus-1.10.1
percent-encoding-2.1.0
pkg-config-0.3.16
powerline-rs-0.2.0
proc-macro2-1.0.6
quote-1.0.2
rand_core-0.3.1
rand_core-0.4.2
rand_os-0.1.3
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.1
rust-argon2-0.5.1
rustc-demangle-0.1.16
smallvec-0.6.10
strsim-0.8.0
syn-1.0.5
synstructure-0.12.1
textwrap-0.11.0
time-0.1.42
unicode-bidi-0.3.4
unicode-normalization-0.1.8
unicode-width-0.1.6
unicode-xid-0.2.0
url-2.1.0
users-0.9.1
vcpkg-0.2.7
vec_map-0.8.1
wasi-0.7.0
winapi-0.3.8
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="powerline-shell rewritten in Rust. Inspired by powerline-go."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/jD91mZM2/powerline-rs"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="BSD-2-Clause ISC MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+git +chrono +users"

DEPEND=""
RDEPEND="git? ( dev-libs/libgit2
				dev-libs/libzip )"

src_compile() {
	cargo_src_compile $(usex git "--features git2" "") $(usex chrono "--features chrono" "") $(usex users "--features users" "")
}

src_install() {
	cargo_src_install $(usex git "--features git2" "") $(usex chrono "--features chrono" "") $(usex users "--features users" "")
}

pkg_postinst() {
	elog "In order for powerline-rs to do anything, you must change your prompt for your shell."
	elog "Instructions can be found here: https://github.com/jD91mZM2/powerline-rs#add-it-to-your-shell"
}
