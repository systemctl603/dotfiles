set -xg LIBGL_ALWAYS_INDIRECT 1
set -xg DISPLAY (/sbin/ip route | awk '/default/ { print $3 }'):0
set -xg EDITOR emacs
set -xg VIRTUAL_ENV_DISABLE_PROMPT 1
set -xg BROWSER wslview
set -xg PATH ~/.cargo/bin $PATH
