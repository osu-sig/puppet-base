class base::centos {
    yum::remove {
        'bluez-gnome':               ensure => absent;
        'bluez-utils':               ensure => absent;
        'bluez-libs':                ensure => absent;
        'b43-fwcutter':              ensure => absent;
        'b43-openfwwf':              ensure => absent;
        'ConsoleKit':                ensure => absent;
        'cups':                      ensure => absent;
        'cups-libs':                 ensure => absent;
        'dbus':                      ensure => absent;
        'iw':                        ensure => absent;
        'matahari':                  ensure => absent;
        'matahari-lib':              ensure => absent;
        'ppp':                       ensure => absent;
        'qpid-qmf':                  ensure => absent;
        'qpid-cpp-client':           ensure => absent;
        'qpid-cpp-server':           ensure => absent;
        'redhat-lsb':                ensure => absent;
        'sysklogd':                  ensure => absent;
        'xorg-x11-drv-ati-firmware': ensure => absent;
        'xmlrpc-c':                  ensure => absent;
        'wireless-tools':            ensure => absent;
        'wpa_supplicant':            ensure => absent;
        'ypbind':                    ensure => absent;
    }

    if $::is_virtual {
        yum::remove {
            'smartmontools': ensure => absent;
        }
    }

    case $::operatingsystemrelease {
        /^5/: {
            yum::remove {
                'chkfontpath':    ensure => absent;
                'NetworkManager': ensure => absent;
                'sendmail':       ensure => absent;
                'xorg-x11-xfs':   ensure => absent;
            }
        }
        default : { }
    }

    service { 'dbus':
        ensure => stopped,
        enable => false,
    }
}
