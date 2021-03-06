# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils

DESCRIPTION="Window manager for the Xfce desktop environment"
HOMEPAGE="https://www.xfce.org/projects/"
SRC_URI="https://archive.xfce.org/src/xfce/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x86-solaris"
IUSE="opengl startup-notification +xcomposite xpresent"

RDEPEND="dev-libs/dbus-glib:=
	>=dev-libs/glib-2.20:=
	>=x11-libs/gtk+-2.24:2=
	x11-libs/libX11:=
	x11-libs/libXext:=
	x11-libs/libXrandr:=
	x11-libs/libXrender:=
	x11-libs/pango:=
	>=x11-libs/libwnck-2.30:1=
	>=xfce-base/libxfce4util-4.10:=
	>=xfce-base/libxfce4ui-4.11:=
	>=xfce-base/xfconf-4.10:=
	opengl? ( media-libs/libepoxy:=[X(+)] )
	startup-notification? ( x11-libs/startup-notification:= )
	xpresent? ( x11-libs/libXpresent )
	xcomposite? (
		x11-libs/libXcomposite:=
		x11-libs/libXdamage:=
		x11-libs/libXfixes:=
		)"
# libICE/libSM: not really used anywhere but checked by configure
#   https://bugzilla.xfce.org/show_bug.cgi?id=11914
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	x11-libs/libICE
	x11-libs/libSM
	xfce-base/exo
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog COMPOSITOR NEWS README TODO )
PATCHES=(
	"${FILESDIR}"/xfwm4-4.13.0-ctrl-f1.patch
)

src_configure() {
	local myconf=(
		$(use_enable opengl epoxy)
		$(use_enable startup-notification)
		--enable-xsync
		--enable-render
		--enable-randr
		$(use_enable xpresent)
		$(use_enable xcomposite compositor)
	)

	econf "${myconf[@]}"
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
