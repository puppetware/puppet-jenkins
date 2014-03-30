# == Class: jenkins::install
#
# Install Jenkins
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class jenkins::install {
  $version = $jenkins::version
  $url_version = regsubst($version, '^(\d+)\.(\d+)\.(\d+)\.(\d+)$', '\1.\2\3\4')

  $source = $::osfamily ? {
    'Darwin' => "http://mirrors.jenkins-ci.org/osx/jenkins-${url_version}.pkg",
    'Windows' => "http://mirrors.jenkins-ci.org/windows/jenkins-${url_version}.zip",
    'Debian' => "http://mirrors.jenkins-ci.org/debian/binary/jenkins-${url_version}_all.deb",
    'RedHat' => "http://mirrors.jenkins-ci.org/redhat/jenkins-${url_version}-1.1.noarch.rpm",
  }

  $provider = $::osfamily ? {
    'Darwin' => "pkgdmg",
    'Windows' => "msi",
    'Debian' => "dpkg",
    'RedHat' => "rpm",
  }

  package {"jenkins-${version}":
    ensure => installed,
    source => "${source}",
    provider => "${provider}",
  }
}
