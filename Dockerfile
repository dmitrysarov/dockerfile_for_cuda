FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

RUN apt-get update && apt-get install git python-pip python3-pip python3-dev python3-tk libgtk2.0-dev tmux -y

COPY pip3_req.txt pip3_req.txt
RUN pip2 install --upgrade pip 
RUN pip3 install --no-binary :all:  --no-cache-dir cython  
RUN pip3 install --upgrade pip && pip3 install -r pip3_req.txt  

RUN git clone https://github.com/matterport/Mask_RCNN.git
RUN git clone https://github.com/dmitrysarov/vim_install.git && cd vim_install && ./install_vim.sh && ./config.sh && cd - && rm -r vim_install
RUN git clone https://github.com/waleedka/coco.git && \
                                 cd coco/PythonAPI && \
               python3 setup.py build_ext --inplace && \
                    mv pycocotools ../../Mask_RCNN && \
                               cd - && rm -rf coco   
COPY jupyter_config /root/.jupyter/jupyter_notebook_config.json
