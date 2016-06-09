# == Class: sysstat::service
#
# This class should be considered private.
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2013 Joshua Hoblitt
#
class sysstat::service {
  service{ 'sysstat':
    hasstatus  => false,
    hasrestart => true,
    enable     => true,
  }

  if $::osfamily == 'Debian' {
    file { '/etc/default/sysstat':
      ensure => file,
      content => @(EOF)
        # Default settings for /etc/init.d/sysstat, /etc/cron.d/sysstat
        # and /etc/cron.daily/sysstat files
        #

        # Should sadc collect system activity informations? Valid values
        # are "true" and "false". Please do not put other values, they
        # will be overwritten by debconf!
        ENABLED="true"
        | EOF
    }
  }
}
