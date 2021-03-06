# class pulp_cgk::admin
class pulp_cgk::admin (
$pulp_server_host = $fqdn,
$pulp_server_port = '443',
$package_version   = 'installed'
) {

  $packagelist = ['pulp-admin-client', 'pulp-puppet-admin-extensions','pulp-rpm-admin-extensions']
  package { $packagelist:
    ensure  => $package_version,
  }
  file { '/etc/pulp/admin/admin.conf':
    ensure  => 'file',
    content => template('pulp/admin.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package[$packagelist],
  }
}
