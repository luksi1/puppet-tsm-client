# tsm
Puppet module for configuring, installing and starting Tivoli Storage Manager's client

## Module description
Tivoli Storage Manage (TSM) is IBM's tool for backing up (and restoring) servers and clients. This Puppet module aims at configuring TSM's dsm.opt and dsm.sys files, installing the appropriate packages (if these packages are available to you via yum or apt-get) and starting/stopping TSM's services. Additionally, there is a server option to provide many servers in your dsm.sys file. This could be beneficial if you need to backup up to different hostnames.

## Setup

### What the TSM module affects
- dsm.sys
- dsm.opt
- TSM services
- TSM packages (including gskcrypt and gskssl)

### Beginning with TSM
To install TSM with the default parameters:
`
class {'tsm':
  opt_server_name => 'FOO'
}

tsm::server{'FOO':
  tcp_server_address => 'foo.domain.com',
}
`

## Usage

### Servers
You can specify multiple server, for instance, in a Tivoli Data Protector, solution:
`
class {'tsm':
  opt_server_name => 'FOO'
}

tsm::server{'FOO':
  tcp_server_address => 'foo.domain.com'
}
tsm::server{'ORCL':
  tcp_server_address => 'oraclehotel.domain.com'
}
`
