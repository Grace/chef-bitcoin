Bitcoin Cookbook
================
[![Cookbook](https://img.shields.io/cookbook/v/bitcoin.svg)](https://supermarket.getchef.com/cookbooks/bitcoin)
[![Build Status](https://travis-ci.org/infertux/chef-bitcoin.svg?branch=master)](https://travis-ci.org/infertux/chef-bitcoin)

This cookbook downloads, installs and configures Bitcoin as a full node.

Requirements
------------

### network
In order to actively contribute to the Bitcoin network, you will need to open your TCP port 8333.
This cookbook does *not* make sure your port 8333 is open since this is very much dependant on your networking setup.

Usage
-----

### Comparison table

| recipe:                             | package                    | binary      | source               |
| :---                                | :---:                      | :---:       | :---:                |
| support most distributions          | only RHEL, CentOS & Fedora | **yes**     | **yes**              |
| support ARM and other architectures | only x86_64                | only x86_64 | **yes**              |
| variants available                  | **Core, Classic & XT**     | Core only¹  | **Core & Unlimited** |
| proper packaging                    | **yes**                    | no          | no                   |
| SELinux support                     | **yes**                    | no          | no                   |

¹ Pull request welcomed.

### `bitcoin::package` recipe

Configures repository from http://www.ringingliberty.com/bitcoin/ and installs pre-packaged binary with `bitcoin` systemd service.

You can run a Bitcoin fork/variant like this:

```
    "bitcoin": {
      "package": {
        "variant": "classic"
      }
    }
```

The valid variants are `core` (default), `unlimited`, `classic` and `xt`.

### `bitcoin::binary` recipe

Downloads the official binary from https://bitcoin.org/ and copies it along with an systemd service script.

### `bitcoin::source` recipe

Downloads the official release from https://github.com/bitcoin/bitcoin/releases and compiles it along with an systemd service script.


License
-------
MIT
