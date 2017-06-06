
include 'git'

include 'wget'

class { 'docker':
  storage_driver => 'overlay2',
}

user { 'riccardo.piccoli':
  ensure => 'present',
  groups => 'docker',
}

$packages = [ 'tree', 'chromium', 'httpie', 'openvpn', 'python-pip', 'network-manager-openvpn-gnome', 'zbar-tools', 'php-elisp', 'openconnect', 'network-manager-openconnect-gnome', 'siege' ]
package { $packages: ensure => 'installed' }

$slack_dependencies = [ 'libappindicator1', 'libdbusmenu-glib4', 'libdbusmenu-gtk4', 'libindicator7' ]
package {
  $slack_dependencies: ensure => 'installed',
  before => Package['slack-desktop'],
}

wget::fetch { "download slack":
  source      => 'https://downloads.slack-edge.com/linux_releases/slack-desktop-2.6.0-amd64.deb',
  destination => '/tmp/',
  timeout     => 0,
  verbose     => false,
  before      => Package['slack-desktop']
}

package { "slack-desktop":
  provider => dpkg,
  ensure   => latest,
  source   => "/tmp/slack-desktop-2.6.0-amd64.deb",
  require  => Package['libappindicator1']
}

package { 'awscli':
  ensure  => 'installed',
  provider => 'pip',
}

class {'docker::compose': 
  ensure => present,
}

