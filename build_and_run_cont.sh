#!/bin/bash
docker build -t tf_image .
nvidia-docker run --rm  --name dmitry_container -it -p 5000-5100:5000-5100 --network host -v /:/all/ -w /all tf_image /bin/bash -c "tmux new-session 'jupyter notebook --allow-root --port=5000 --ip=0.0.0.0'"
