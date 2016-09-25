# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#Class for server
#
class runpuppet::pupserver {
  notice ( "Hostname is ${::hostname}" )
  $domain_var = '.minsk.epam.com'

 exec { 'root_bash_profile':
    command  => 'source /root/.bash_profile',
    provider => shell,
    require  => Package['puppetserver'],
  }
 file { '/etc/hosts':
    content => template('/vagrant/runpuppet/templates/hosts.erb'),
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  package { 'puppetserver':
    ensure  => 'installed',
    require => File['/etc/hosts'],
  }

  service { 'puppetserver':
    ensure  => 'running',
    require => Package['puppetserver'],
  }

  package { 'puppet-lint':
    ensure   => '1.1.0',
    provider => 'gem',
  }
}
