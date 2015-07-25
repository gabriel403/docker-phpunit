# PHPUnit Docker Container

[Docker](https://www.docker.com) container to install and run [PHPUnit](https://phpunit.de/).

Ripped off from [phpunit/phpunit](https://github.com/JulienBreux/phpunit-docker) but with added xdebug!

## Features

* [PHPUnit](https://www.phpunit.de/)
  * Latest snapshot (master)
* [PHP](http://php.net) [5.6](http://php.net/ChangeLog-5.php)
* [xdebug](http://xdebug.org/) for code coverage

## Installation / Usage

1. Install the gabriel403/phpunit container:

    ``` sh
	$ docker pull gabriel403/phpunit
	```

2. Create a phpunit.xml defining your tests suites.

    ``` xml
    <?xml version="1.0" encoding="UTF-8"?>

    <phpunit backupGlobals="false"
             backupStaticAttributes="false"
             colors="true"
             convertErrorsToExceptions="true"
             convertNoticesToExceptions="true"
             convertWarningsToExceptions="true"
             processIsolation="false"
             stopOnFailure="false"
             syntaxCheck="false"
             bootstrap="tests/phpunit/bootstrap.php"
    >
        <testsuites>
            <testsuite name="My Test Suite">
                <directory>./tests/phpunit/</directory>
            </testsuite>
        </testsuites>

        <logging>
            <log type="coverage-html" target="build/coverage"/>
            <log type="coverage-clover" target="build/logs/clover.xml"/>
        </logging>

        <filter>
            <whitelist>
                <directory>./src/</directory>
            </whitelist>
        </filter>
    </phpunit>

    ```

3. Run PHPUnit through the PHPUnit container:

    ``` sh
	$ docker run -v $(pwd):/app gabriel403/phpunit
    ```

To run, test and develop the PHPUnit Dockerfile itself, you must use the source directly:

1. Download the source:

    ``` sh
	$ git clone https://github.com/gabriel403/docker-phpunit.git
    ```

2. Switch to the docker-phpunit directory:

    ``` sh
	$ cd docker-phpunit
    ```

3. Build the container:

    ``` sh
	$ docker build -t gabriel403/phpunit .
    ```

4. Test running the container:

    ``` sh
	$ docker run gabriel403/phpunit --help
	```
