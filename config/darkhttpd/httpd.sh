#!/bin/sh

test "$(pgrep -f 'darkhttpd /tmp/www')" || \
  darkhttpd /tmp/www --daemon --port 3000 >/dev/null 2>&1
