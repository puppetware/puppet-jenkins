# == Class: jenkins
#
# Install Jenkins CI
#
# === Parameters:
#
# [*version*] Version of Jenkins to install
#
# === Examples
#
#  class { 'jenkins':
#    version => '1.5.5.6',
#  }
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class jenkins (
  $version = $jenkins::params::version
) inherits jenkins::params {

  anchor {'jenkins::begin': } ->
  class {'jenkins::install': } ->
  anchor {'jenkins::end': }

}
