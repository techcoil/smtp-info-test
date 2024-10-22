# smtp-info-test

A CLI utility for validating SMTP Credentials

## Use with docker
    
```bash
docker run --rm -it techcoil/smtp-info-test [SMTP Connection String]
```

### Usage

```
Usage: smtp-info-test [OPTIONS...] [ARGUMENTS...]

Arguments:
  [connectionString]    URL Format [[SCHEME://][[USER[:PASSWORD]]@]HOST[:PORT]

Options:
  [-f|--from]          Email address of the sender
  [-t|--to]            Recipient for test email
  [-h|--host]          SMTP Server Host. Supports
  [-e|--encryption]    Encryption Type (none/TLS/SSL)
  [--no-auth]          Disable SMTP Authentication
  [-u|--user]          SMTP Server User
  [-p|--password]      !!Unsafe!! SMTP Server Password
  [-p|--port]          Port number [Default: 25 for None encryption, 587 for TLS/SSL]
  [-H|--help]          Show help
  [-v|--verbosity]     Verbosity level
  [-V|--version]       Show version

```

### Install from Source
Requires php 8.x and [composer](https://getcomposer.org/download)

1. Clone the repository `git clone https://github.com/techcoil/smtp-info-test.git && cd smtp-info-test`
2. Run `composer install` to install dependencies
3. Install with `bash ./build/install.sh`
4. Run `$ smtp-info-test --help`w