class base {
    # Operating System or Family specific base include/excludes
    case $::operatingsystem {
        'fedora', 'centos', 'redhat': {
            include base::el
        }
        default: {
            notice("${::operatingsystem} is unsupported")
        }
    }

    # Default modules we want installed
    #include motd, postfix, bash, git
    include git, motd, selinux

    # Clear our our tmp dirs every week
    tidy { '/tmp':
        age     => '1w',
        recurse => true,
    }
}
