# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit xfconf

DESCRIPTION="Xfce's freedesktop.org specification compatible menu implementation library"
HOMEPAGE="https://docs.xfce.org/xfce/exo/start"
SRC_URI="https://archive.xfce.org/src/libs/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="LGPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ia64 ~mips ppc ppc64 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.30:=
	>=x11-libs/gtk+-2.24:2=
	>=x11-libs/gtk+-3.14:3=
	>=xfce-base/libxfce4ui-4.11.1:=[gtk3(+)]
	>=xfce-base/libxfce4util-4.11:="
DEPEND="${RDEPEND}
	dev-util/gtk-doc-am
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig"

pkg_setup() {
	XFCONF=(
		$(xfconf_use_debug)
		)

	DOCS=( AUTHORS ChangeLog HACKING NEWS README STATUS TODO )
}
