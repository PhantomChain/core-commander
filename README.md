# PhantomChain Commander

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
bash commander.sh
```

## Development

```sh
git clone https://github.com/PhantomChain/core-commander -b develop
cd core-commander/.dev/{operating_system}
vagrant up
vagrant ssh
cd /vagrant
bash commander.sh
```

## Security

If you discover a security vulnerability within this package, please send an e-mail to security@ark.io. All security vulnerabilities will be promptly addressed.

## Credits

- [Brian Faust](https://github.com/faustbrian)
- [Alex Barnsley](https://github.com/alexbarnsley)
- [All Contributors](https://github.com/PhantomChain/core-commander/graphs/contributors)
