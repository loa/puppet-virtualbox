# Installs VirtualBox
#
# Usage:
#
#   include virtualbox
class virtualbox {

  exec { 'Kill Virtual Box Processes':
    command     => 'pkill "VBoxXPCOMIPCD" || true && pkill "VBoxSVC" || true && pkill "VBoxHeadless" || true',
    path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
    refreshonly => true,
  }

  package { 'VirtualBox-4.3.10-93012':
    ensure   => installed,
    provider => 'pkgdmg',
    source   => 'http://dlc.sun.com.edgesuite.net/virtualbox/4.3.10/VirtualBox-4.3.10-93012-OSX.dmg',
    require  => Exec['Kill Virtual Box Processes'],
  }
}
