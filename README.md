docker-coturn
=============

A Docker container running the coturn STUN/TURN server (https://github.com/coturn/coturn)

By default the external IP is retrieved with a request to http://whatismyip.akamai.com.
It can be manually set via the `EXTERNAL_IP` environment var.

### Usage

To run this container:

    $ docker run -d simonbru/coturn

Additional configuration can be set through CLI arguments or using the config file `/conf/turnserver.conf`.
