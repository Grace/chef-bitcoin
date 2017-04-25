#
# Cookbook Name:: bitcoin
# Attributes:: default
#

# common settings

default['bitcoin']['variant'] = 'core' # possible variants: core, unlimited, classic, xt
default['bitcoin']['user'] = 'bitcoin'
default['bitcoin']['home'] = "/home/#{node['bitcoin']['user']}"
default['bitcoin']['conf_dir'] = "#{node['bitcoin']['home']}/.bitcoin"
default['bitcoin']['conf_file'] = "#{node['bitcoin']['conf_dir']}/bitcoin.conf"
default['bitcoin']['service_file'] = "/usr/lib/systemd/system/bitcoind.service"
default['bitcoin']['archive_file'] = "#{node['bitcoin']['variant']}.tar.gz"
default['bitcoin']['archive_path'] = "#{Chef::Config['file_cache_path']}/bitcoin/#{node['bitcoin']['archive_file']}"
default['bitcoin']['extract_path'] = "#{Chef::Config['file_cache_path']}/bitcoin/#{node['bitcoin']['variant']}"
default['bitcoin']['prefix'] = "/usr/local"
default['bitcoin']['bitcoind'] = "#{node['bitcoin']['prefix']}/bin/bitcoind"
default['bitcoin']['bitcoin_cli'] = "#{node['bitcoin']['prefix']}/bin/bitcoin-cli"
default['bitcoin']['checkblocks'] = 288 # NOTE: this is the default, you might want to decrease it with very low-end CPUs to get fast boot time

# 'binary' recipe

default['bitcoin']['binary']['version']['core']       = '0.14.1'
default['bitcoin']['binary']['version']['unlimited']  = '1.0.1.4'
default['bitcoin']['binary']['version']['classic']    = '1.2.5'
default['bitcoin']['binary']['url']['core']           = "https://bitcoin.org/bin/bitcoin-core-#{node['bitcoin']['binary']['version']['core']}/bitcoin-#{node['bitcoin']['binary']['version']['core']}-x86_64-linux-gnu.tar.gz"
default['bitcoin']['binary']['url']['unlimited']      = "https://www.bitcoinunlimited.info/downloads/bitcoinUnlimited-#{node['bitcoin']['binary']['version']['unlimited']}-linux64.tar.gz"
default['bitcoin']['binary']['url']['classic']        = "https://github.com/bitcoinclassic/bitcoinclassic/releases/download/v#{node['bitcoin']['binary']['version']['classic']}/bitcoin-#{node['bitcoin']['binary']['version']['classic']}-linux64.tar.gz"
default['bitcoin']['binary']['checksum']['core']      = '0c6920a9f3181a95ca029fdac5342b5702569ee441ec2128d19051f281683058'
default['bitcoin']['binary']['checksum']['unlimited'] = 'f82b98f552ae49c7bca011325a5d9374425e78d91c1baac02cba64b358beb563'
default['bitcoin']['binary']['checksum']['classic']   = '91438d75349814e49d54fdcbce2af42ebf561048688cecf59fbd293bbb1ef77c'

# 'package' recipe

default['bitcoin']['package']['repo_url']['rhel']        = 'https://linux.ringingliberty.com/bitcoin/el7/x86_64/bitcoin-release-3-1.noarch.rpm'
default['bitcoin']['package']['repo_checksum']['rhel']   = '450481b2ff04579ca109a90b3ce4399ea75b917b8398dc7f9baccceea7578631'
default['bitcoin']['package']['repo_url']['fedora']      = 'https://linux.ringingliberty.com/bitcoin/f23/x86_64/bitcoin-release-3-1.noarch.rpm'
default['bitcoin']['package']['repo_checksum']['fedora'] = 'ab6f4fd8f5f7875303e6b068b1bb3e1632b1f94bb3ad900777b37f7a0b7dce46'

# 'source' recipe

default['bitcoin']['source']['version']['core']       = 'v0.14.1'
default['bitcoin']['source']['version']['unlimited']  = '1.0.1.4'
default['bitcoin']['source']['version']['classic']    = '1.2.5'
default['bitcoin']['source']['url']['core']           = "https://github.com/bitcoin/bitcoin/archive/#{node['bitcoin']['source']['version']['core']}.tar.gz"
default['bitcoin']['source']['url']['unlimited']      = "https://github.com/BitcoinUnlimited/BitcoinUnlimited/archive/#{node['bitcoin']['source']['version']['unlimited']}.tar.gz"
default['bitcoin']['source']['url']['classic']        = "https://github.com/bitcoinclassic/bitcoinclassic/archive/v#{node['bitcoin']['source']['version']['classic']}.tar.gz"
default['bitcoin']['source']['checksum']['core']      = '81a121526d5f77626a4f3d5ef2b390615e937e0aa9dc077c38c935bd7ce65d85'
default['bitcoin']['source']['checksum']['unlimited'] = '4aaa7dd1a5cd6e72f96ac26a05900a21f96d08ee694493bdc7f71d9b608789aa'
default['bitcoin']['source']['checksum']['classic']   = '900218eb2cd40c96a357a601e17fc6eacc91970f369761462de5a695c20701d5'
default['bitcoin']['source']['dependencies']['debian'] = %w(
  build-essential libtool autoconf pkg-config libssl-dev libevent-dev
  libboost-system-dev libboost-filesystem-dev libboost-chrono-dev
  libboost-program-options-dev libboost-test-dev libboost-thread-dev
  libboost-system-dev libboost-test-dev libboost-thread-dev
)
default['bitcoin']['source']['dependencies']['rhel'] = %w(
  gcc-c++ libtool make autoconf automake openssl-devel libevent-devel
  boost-devel
)
default['bitcoin']['source']['dependencies']['freebsd'] = %w(
  autoconf automake libtool pkgconf gmake boost-all openssl
).join(' ')
default['bitcoin']['source']['configure_options'] = "--with-gui=no --disable-wallet --without-miniupnpc --disable-zmq --disable-tests --prefix=#{node['bitcoin']['prefix']}"
default['bitcoin']['source']['make_options'] = '-j1'
