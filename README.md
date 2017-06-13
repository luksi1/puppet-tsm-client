# tsm
Puppet module for configuring, installing and starting Tivoli Storage Manager's client

## Module description
Tivoli Storage Manage (TSM) is IBM's tool for backing up (and restoring) servers and clients. This Puppet module aims at configuring TSM's dsm.opt and dsm.sys files, installing the appropriate packages (if these packages are available to you via yum or apt-get) and starting/stopping TSM's services. Additionally, there is a server option to provide servers in your dsm.sys file. This could be beneficial if you need to backup up to different hostnames.

Finally, there are a set of facter variables to help management.

- tsm_version
- tsm_access
- tsm_filesystems

See more on these under "Facter Variables"

## Setup

### What the TSM module affects
- dsm.sys
- dsm.opt
- TSM services
- TSM packages (including gskcrypt and gskssl)

### Beginning with TSM
To install the TSM client with the default parameters:
```
class {'tsm':
  server_name => 'FOO'
}

tsm::server{'FOO':
  tcp_server_address => 'foo.domain.com',
}
```

This will create a dsm.opt file with the entry ```SERVERNAME foo``` and a dsm.sys file with the an entry called FOO, pointing to the TCP address 'foo.domain.com', which should be your TSM server.

## Usage

### Servers
You can specify multiple servers, for instance, in a Tivoli Data Protector, solution:
```
class {'tsm':
  server_name => 'FOO'
}

tsm::server{'FOO':
  tcp_server_address => 'foo.domain.com'
}
tsm::server{'ORCL':
  tcp_server_address => 'oraclehotel.domain.com'
}
```

## Facter Variables

### tsm_version
Return the TSM client version.

### tsm_access
Whether or not your client can access the TSM server. Returns true or false

### tsm_filesystems
Returns a hash of: filesystem => last incremental backup date
