include 'docker'

include 'git'

file { '/etc/systemd/system/docker.service':
  content => '[Service]
ExecStart=/usr/bin/docker daemon --storage-driver=overlay2',
}

$packages = [ 'tree', 'chromium', 'httpie' ]
package { $packages: ensure => 'installed' }
