# -*- mode: ruby -*-
# vi: set ft=ruby :
#-----------------------------
#         Class for server


class runpuppet::pupnode {
	host { 'serverpuppet':
		host_aliases => 'serverpuppet.minsk.epam.com',
		ip => '192.168.33.16',
	}
	
	package { 'puppet-repo': 
		ensure  => installed,
		provider => rpm,
		source => 'https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm'
	}
	
	package { 'puppet-agent':
		ensure => 'latest',
		require => Package['puppet-repo'],
	}
	
	service { 'puppet':
		ensure => 'running',
		require => Package['puppet-agent'],    
	}
}
