Description
===========

Installs nginx from package OR source code and sets up configuration handling similar to Debian's Apache2 scripts.

Requirements
============

Cookbooks
---------

* build-essential (for nginx::source)
* runit (for nginx::source)
* ohai (for nginx::ohai_plugin)

Platform
--------

* Debian
* Ubuntu

The `nginx::source` may work anywhere "build-essential" is avaialble.

**RHEL/CentOS** The `nginx::source` recipe should work on RHEL/CentOS with "init" as the init style attribute.

Attributes
==========

Node attributes for this cookbook are logically separated into
different files. Some attributes are set only via a specific recipe.

## default.rb

Generally used attributes. Some have platform specific values. See `attributes/default.rb`. "The Config" refers to "nginx.conf" the main config file.

**v0.101.0 - Attribute Change**: `node['nginx']['url']` is now `node['nginx']['source']['url']` as the URL was only used when retrieving the source to build Nginx.

* `node['nginx']['dir']` - Location for Nginx configuration.
* `node['nginx']['log_dir']` - Location for Nginx logs.
* `node['nginx']['user']` - User that Nginx will run as.
* `node['nginx']['binary']` - Path to the Nginx binary.
* `node['nginx']['init_style']` - How to run Nginx as a service when using `nginx::source`. Values can be "runit", "init" or "bluepill". When using runit or bluepill, those recipes will be included as well and are dependencies of this cookbook. Not used in the `nginx` recipe because the package manager's init script style for the platform is assumed.
* `node['nginx']['pid']` - Location of the PID file.
* `node['nginx']['keepalive']` - Whether to use `keepalive_timeout`, any value besides "on" will leave that option out of the config.
* `node['nginx']['keepalive_timeout']` - used for config value of `keepalive_timeout`.
* `node['nginx']['worker_processes']` - used for config value of `worker_processes`.
* `node['nginx']['worker_connections']` - used for config value of `events { worker_connections }`
* `node['nginx']['server_names_hash_bucket_size']` - used for config value of `server_names_hash_bucket_size`.
* `node['nginx']['disable_access_log']` - set to true to disable the general access log, may be useful on high traffic sites.

### Attributes for configuring the gzip module

* `node['nginx']['gzip']` - Whether to use gzip, can be "on" or "off"
* `node['nginx']['gzip_http_version']` - used for config value of `gzip_http_version`.
* `node['nginx']['gzip_comp_level']` - used for config value of `gzip_comp_level`.
* `node['nginx']['gzip_proxied']` - used for config value of `gzip_proxied`.
* `node['nginx']['gzip_types']` - used for config value of `gzip_types` - must be an Array.

### Attributes set in recipes

*nginx::source*

* `node['nginx']['daemon_disable']` -  Whether the daemon should be disabled which can be true or false; disable the daemon (run in the foreground) when using a service supervisor such as runit or bluepill for "init_style". This is automatically set in the `nginx::source` recipe when the init style is not bluepill or runit.

*nginx::authorized_ips*

* `node['nginx']['remote_ip_var']` -  The remote ip variable name to use.
* `node['nginx']['authorized_ips']` - IPs authorized by the module

*nginx::http_realip_module*

From: http://wiki.nginx.org/HttpRealIpModule

* `node['nginx']['realip']['header']` - Header to use for the RealIp Module; only accepts "X-Forwarded-For" or "X-Real-IP"
* `node['nginx']['realip']['addresses']` - Addresses to use for the `http_realip` configuration.

## source.rb

These attributes are used in the `nginx::source` recipe. Some of them are dynamically modified during the run. See `attributes/source.rb` for default values.

* `node['nginx']['source']['url']` - (versioned) URL for the Nginx source code. By default this will use the version specified as `node['nginx']['version'].
* `node['nginx']['source']['prefix']` - (versioned) prefix for installing nginx from source
* `node['nginx']['source']['conf_path']` - location of the main config file, in `node['nginx']['dir']` by default.
* `node['nginx']['source']['modules']` - Array of modules that should be compiled into Nginx by including their recipes in `nginx::source`.
* `node['nginx']['source']['default_configure_flags']` - The default flags passed to the configure script when building Nginx.
* `node['nginx']['configure_flags']` - Preserved for compatibility and dynamically generated from the `node['nginx']['source']['default_configure_flags']` in the `nginx::source` recipe.

## geoip.rb

These attributes are used in the `nginx::http_geoip_module` recipe.

* `node['nginx']['geoip']['path']` - Location where to install the geoip libraries.
* `node['nginx']['geoip']['enable_city']` - Whether to enable City data
* `node['nginx']['geoip']['country_dat_url']` - Country data tarball URL
* `node['nginx']['geoip']['country_dat_checksum']` - Country data tarball checksum
* `node['nginx']['geoip']['city_dat_url']` - City data tarball URL
* `node['nginx']['geoip']['city_dat_checksum']` - City data tarball checksum
* `node['nginx']['geoip']['lib_version']` - Version of the GeoIP library to install
* `node['nginx']['geoip']['lib_url']` - (Versioned) Tarball URL of the GeoIP library
* `node['nginx']['geoip']['lib_checksum']` - Checksum of the GeoIP library tarball

## upload_progress.rb

These attributes are used in the `nginx::upload_progress_module` recipe.

* `node['nginx']['upload_progress]['url']` - URL for the tarball.
* `node['nginx']['upload_progress']['checksum']` - Checksum of the tarball.

Recipes
=======

This cookbook provides two main recipes for installing Nginx.

* default.rb: *Use this recipe* if you have a native package for Nginx.
* source.rb: *Use this recipe* if you do not have a native package for Nginx, or if you want to install a newer version than is available, or if you have custom module compilation needs.

Several recipes are related to the `source` recipe specifically. See that recipe's section below for a description.

## default.rb

The default recipe will install Nginx as a native package for the system through the package manager and sets up the configuration according to the Debian site enable/disable style with `sites-enabled` using the `nxensite` and `nxdissite` scripts. The nginx service will be managed with the normal init scripts that are presumably included in the native package.

Includes the `ohai_plugin` recipe so the plugin is available.

## ohai_plugin.rb

This recipe provides an Ohai plugin as a template. It is included by both the `default` and `source` recipes.

## authorized_ips.rb

Sets up configuration for the `authorized_ip` nginx module.

## source.rb

This recipe is responsible for building Nginx from source. It ensures that the required packages to build Nginx are installed (pcre, openssl, compile tools). The source will be downloaded from the `node['nginx']['source']['url']`. The `node['nginx']['user']` will be created as a system user. The appropriate configuration and log directories and config files will be created as well according to the attributes `node['nginx']['dir']` and 'node['nginx']['log_dir']`.

The recipe attempts to detect whether additional modules should be added to the configure command through recipe inclusion (see below), and whether the version or configuration flags have changed and should trigger a recompile.

The nginx service will be set up according to `node['nginx']['init_style']`. Available options are:

* runit: uses runit cookbook and sets up `runit_service`.
* bluepill: uses bluepill cookbook and sets up `bluepill_service`.
* anything else (e.g., "init") will use the nginx init script template.

**RHEL/CentOS** This recipe should work on RHEL/CentOS with "init" as the init style.

The following recipes are used to build module support into Nginx:

* `http_geoip_module.rb` - installs the GeoIP libraries and data files and enables the module for compilation.
* `http_gzip_static_module.rb` - enables the module for compilation.
* `http_realip_module.rb` - enables the module for compilation and creates the configuration.
* `http_ssl_module.rb` - enables SSL for compilation.
* `http_stub_status_module.rb` - provides `nginx_status` configuration and enables the module for compilation.
* `upload_progress_module.rb` - builds the `upload_progress` module and enables it as a module when compiling nginx.

Ohai Plugin
===========

The `ohai_plugin` recipe includes an Ohai plugin. It will be automatically installed and activated, providing the following attributes via ohai, no matter how nginx is installed (source or package):

* `node['nginx']['version']` - version of nginx
* `node['nginx']['configure_arguments']` - options passed to ./configure when nginx was built
* `node['nginx']['prefix']` - installation prefix
* `node['nginx']['conf_path']` - configuration file path

In the source recipe, it is used to determine whether control attributes for building nginx have changed.

Usage
=====

Include the recipe on your node or role that fits how you wish to install Nginx on your system per the recipes section above. Modify the attributes as required in your role to change how various configuration is applied per the attributes section above. In general, override attributes in the role should be used when changing attributes.

There's some redundancy in that the config handling hasn't been separated from the installation method (yet), so use only one of the recipes, default or source.

License and Author
==================

Author:: Joshua Timberman (<joshua@opscode.com>)
Author:: Adam Jacob (<adam@opscode.com>)
Author:: AJ Christensen (<aj@opscode.com>)
Author:: Jamie Winsor (<jamie@vialstudios.com>)

Copyright:: 2008-2012, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
