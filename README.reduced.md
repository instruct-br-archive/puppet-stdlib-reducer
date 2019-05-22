# Reduced Puppet stdlib module

*WARNING: This is VERY experimental and VERY opinionated*

This is an attempt to reduce the footprint of the traditional Puppet module `stdlib`.

We remove most of the deprecated functions and much more.

Check the `deprecated-functions.txt` file on this repository and also the `reducer.sh` script.

The resulting module supports Puppet 5.5 or newer.

For more information on what is being removed check https://github.com/instruct-br/puppet-stdlib-reducer

## TODO

1) Some deprecated functions are used by unit tests and are still present:

* is_integer
* is_absolute_path
* str2bool

2) Document native code alternatives for the removed functions

3) Inspect the compat type aliases

4) Track each release of `stdlib`
