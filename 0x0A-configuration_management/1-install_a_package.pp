# Ensure that pip3 is installed
package { 'python3-pip':
  ensure => installed,
}

# Install Werkzeug version 2.1.1
exec { 'install_werkzeug':
  command => '/usr/bin/pip3 install werkzeug==2.1.1',
  path    => ['/usr/bin', '/usr/local/bin'],
  unless  => '/usr/bin/pip3 show werkzeug | grep "Version: 2.1.1"',
}

# Install Flask version 2.1.0
exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  path    => ['/usr/bin', '/usr/local/bin'],
  unless  => '/usr/bin/pip3 show flask | grep "Version: 2.1.0"',
}
