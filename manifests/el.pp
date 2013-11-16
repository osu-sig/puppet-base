class base::el {
    # This is the enteprise linux class, we will split it off more
    # for centos or redhat
    if $::osfamily != redhat {
        fail("${::operatingsystem} not supported")
    }

    class { 'yum':
        extrarepo => ['epel', 'puppetlabs'],
    }

    package { 'htop':
        ensure  => present,
        require => Class['yum'],
    }

    package { [
        'rsync',
        'acl',
        'sysstat',
        'tcpdump',
        'wget',
        'lsof',
        'lynx',
        'unzip',
        'man'
    ]:
        ensure => present,
    }

    case $::operatingsystemrelease {
        /^5/: {
            yum::remove {
                'smartmontools': ensure => absent;
            }
        }
        default: { }
    }

    service { 'cups':
        ensure => stopped,
        enable => false,
    }

    service { 'iptables':
        ensure => stopped,
        enable => false, 
    }

    service { 'pcscd':
        ensure => stopped,
        enable => false,
    }

    case $::operatingsystem {
        'centos': {
            include base::centos
        }
        'redhat': {
            include base::redhat
        }
        default: { }
    }
}
