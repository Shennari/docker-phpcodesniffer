FROM php:8.0-cli

# Install build dependencies
RUN set -eux \
	&& DEBIAN_FRONTEND=noninteractive apt-get update -qq \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		curl \
		git \
	&& curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
    && curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar

RUN set -eux \
    && chmod +x /phpcs.phar \
    && chmod +x /phpcbf.phar \
	&& mv /phpcs.phar /usr/bin/phpcs \
	&& mv /phpcbf.phar /usr/bin/phpcbf

ENV WORKDIR /data
WORKDIR /data

ENTRYPOINT ["php"]
CMD ["-v"]


