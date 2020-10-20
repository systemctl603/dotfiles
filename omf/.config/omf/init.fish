set -xg LIBGL_ALWAYS_INDIRECT 1
set -xg DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
set -xg EDITOR emacs
set -xg VIRTUAL_ENV_DISABLE_PROMPT 1
set -xg BROWSER wslview
