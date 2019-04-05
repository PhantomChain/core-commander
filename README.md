# Phantom Chain Commander

**:warning: Deprecated from the 11.03.2019 onwards - Ark Core comes with a built-in CLI since v2.2.0 and provides an installation script :warning:**

<p align="center">
    <img src="https://github.com/PhantomChain/core-commander/blob/master/banner.png" />
</p>

> A shell script to easily setup, configure and maintain [PhantomChain](https://github.com/PhantomChain/core).

## Installation

```bash
adduser phantom
usermod -a -G sudo phantom
git clone https://github.com/PhantomChain/core-commander
cd core-commander
bash PHANTOMcommander.sh
```

## Development

```sh
git clone https://github.com/PhantomChain/core-commander -b develop
cd core-commander/.dev/{operating_system}
vagrant up
vagrant ssh
cd /vagrant
bash PHANTOMcommander.sh
```

## Security

If you discover a security vulnerability within this package, please send an e-mail to security@ark.io. All security vulnerabilities will be promptly addressed.

## Credits

- [Brian Faust](https://github.com/faustbrian)
- [Alex Barnsley](https://github.com/alexbarnsley)
- [All Contributors](https://github.com/PhantomChain/core-commander/graphs/contributors)
