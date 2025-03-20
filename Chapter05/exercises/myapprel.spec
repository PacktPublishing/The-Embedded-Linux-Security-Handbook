Name:          myapprel
Version:       1.0
Release:       1
Summary:       Example custom app release file installer
License:       MIT License

%description
This will install a custom release text for your appliance

%prep
# we have no source code - so let's skip this

%build
cat > myappliance-release << EOF
Welcome to my secure embedded linux system
version 1.0
EOF

%install
mkdir -p %{buildroot}/etc
install -m 644 myappliance-release %{buildroot}/etc/myappliance-release

%files
/etc/
/etc/myappliance-release

%changelog
# nothing to report on the first attempt


