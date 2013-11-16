class base::redhat {
    yum::remove {
        'bluez-gnome':         ensure => absent;
        'bluez-libs':          ensure => absent;
        'bluez-utils':         ensure => absent;
        'cups-libs':           ensure => absent;
        'iw':                  ensure => absent;
        'matahari':            ensure => absent;
        'matahari-lib':        ensure => absent;
        'NetworkManager':      ensure => absent;
        'NetworkManager-glib': ensure => absent;
        'sendmail':            ensure => absent;
        'wpa_supplicant':      ensure => absent;
        'xmlrpc-c':            ensure => absent;
        'ypbind':              ensure => absent;
    }

    service {
        'haldaemon':
            ensure  => stopped,
            enable  => false;
        'syslog':
            ensure  => stopped,
            enable  => false;
    }
}
