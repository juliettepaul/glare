Summary: A light-weight replacement for glance
Name: glare
Version: 0.0.5
Release: 1%{?dist}
License: MIT
Group: Applications/Internet
Url: http://www.github.com/jayson/glare
Source: https://github.com/jayson/glare/archive/v%{version}.tar.gz

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
Requires: wget >= 1.14
Requires: pv


%description
Super lightweight image provisioning system

%prep
%setup -q

%build

%install
PREFIX="$RPM_BUILD_ROOT/usr/local" make install

%files
/usr/local/bin/glare
/usr/local/bin/glare-add-image
/usr/local/bin/glare-sync
/usr/local/bin/glare-*

