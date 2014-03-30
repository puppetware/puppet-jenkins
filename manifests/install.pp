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

  case $::osfamily {
    'Darwin': {
      $source   = "http://mirror.xmission.com/jenkins/osx/jenkins-${url_version}.pkg"
      $provider = 'apple'
    }
    default: {
      fail("Unsupported Kernel: ${::kernel} Operating System: ${::operatingsystem}")
    }
  }

  package {"jenkins-${version}":
    ensure   => installed,
    source   => "${source}",
    provider => "${provider}",
  }
}
