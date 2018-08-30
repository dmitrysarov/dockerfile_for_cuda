#!/bin/bash
docker build -t tf_image .
nvidia-docker run --rm  --name dmitry_container -it -p 5000-5100:5000-5100 -v /:/all/ -w /all/media/hdd1/dmitry/note_books tf_image /bin/bash -c "tmux new-session 'jupyter notebook --allow-root --port=5000 --ip=0.0.0.0'"
