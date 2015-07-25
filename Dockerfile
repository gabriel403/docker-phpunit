# PHPSpec Docker Container
FROM phpunit/phpunit
MAINTAINER Gabriel Baker <me@g403.co>

# Goto temporary directory
WORKDIR /tmp

# Run composer and phpunit installation.
RUN pecl install xdebug
RUN echo "zend_extension=$(command find '/usr/local/lib/php/' -name 'xdebug.so' | command head -n 1)" >> "/usr/local/etc/php/php.ini"

# Set up the application directory.
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments.
ENTRYPOINT ["/usr/local/bin/phpunit"]

