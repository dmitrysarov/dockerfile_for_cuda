#!/bin/bash
docker build -t tf_image_test .
nvidia-docker run --rm  --name dmitry_test_mask -it -p 4211:4211 -p 4212:4212 -p 4213:4113  -v /media/hdd1/dmitry/:/hdd/dmitry/ -v /media/ssd2/dmitry/:/ssd/dmitry/ -w / tf_image_test /bin/bash -c "tmux new-session 'jupyter notebook --allow-root --port=4211 --ip=0.0.0.0'"
