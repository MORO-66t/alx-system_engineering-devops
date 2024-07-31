# Ensure that pip3 is installed
package { 'python3-pip':
  ensure => installed,
}

# Install Flask version 2.1.0 using pip3
exec { 'install_flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  path    => ['/usr/bin', '/usr/local/bin'],
  unless  => '/usr/bin/pip3 show flask | grep "Version: 2.1.0"',
}

# Optionally, ensure Flask is installed correctly
exec { 'verify_flask_version':
  command => '/usr/bin/python3 -m flask --version',
  path    => ['/usr/bin', '/usr/local/bin'],
  onlyif  => '/usr/bin/pip3 show flask | grep "Version: 2.1.0"',
}
