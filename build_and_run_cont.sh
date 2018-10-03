#!/bin/bash
docker build -t tf_image_cpu .
docker run --rm  --name dmitry_tf_cpu -it -p 5000-5100:5000-5100 --network host -v /:/all/ -w /all tf_image_cpu /bin/bash -c "export TERM=xterm-256color; tmux new-session 'jupyter notebook --allow-root --port=5000 --ip=0.0.0.0'"
