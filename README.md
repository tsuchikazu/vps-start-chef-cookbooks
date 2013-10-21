# Chef Cookbooks for VPS start

## Description

Sets up VPS to start configuration like EC2. Configuration listed below:

 * create normal user with SSH key and sudo authorized
 * disable SSH root login and password login
 * open 80, 22, 433 port by iptables

## Setup

### Ruby Libraries

You have to install the gem libraries listed below:

  * knife-solo
  * berkshelf

the gem libraries are managed by bundler. So You can install these libraries by following commands.

```sh
$ gem install bundler
$ bundle install --path vendor/bundle
```

### Chef cookbooks

Download dependent Chef cookbooks with `berkshelf`:

```sh
$ bundle exec berks install --path cookbooks
```

## Provision VPS Hosts

Prepare remote host:

```sh
$ bundle exec knife solo prepare root@ip_address
```

Edit `node/ip_address.json`:

```json
{
  "run_list":[
    "role[base]"
  ], 
  "site_user": {
    "username": "tsuchikazu", 
    "ssh_keys": ["ssh-rsa AAAAB3Nz..."] 
  }, 
  "authorization": {
    "sudo": {
      "users":["tsuchikazu"]
    }
  }
}
```

Then provision it:

```sh
$ bundle exec knife solo cook root@ip_address
```

From the 2nd time, you have to use `username` user for login user:

```sh
$ bundle exec knife solo cook username@ip_address
```
