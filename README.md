Puppet Module - Jenkins CI
==========================

Puppet module to install Jenkins CI.

Supported Platforms:

- Darwin

Usage
-----

Install Jenkins 1.5.5.6:

```
class {'jenkins': }
```

Install a specific version of Jenkins:

```
class {'jenkins':
  version => '1.5.5.0',
}
```

A [full list][1] of available versions.

[1]: http://mirror.xmission.com/jenkins/osx/

License
=======

puppet-jenkins is distributed under the UNLICENSE license. For details, see:
[http://unlicense.org/][2]

[2]: http://unlicense.org/
