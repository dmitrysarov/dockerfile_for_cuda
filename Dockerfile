FROM nvidia/cuda:9.0-cudnn7-devel
RUN apt-get update && apt-get install git python-pip python3-pip python3-dev python3-tk libgtk2.0-dev tmux wget libcurl4-gnutls-dev python-dev curl -y 

COPY pip3_req.txt pip3_req.txt
RUN python3 -m pip install --upgrade pip && python3 -m pip install --no-binary :all:  --no-cache-dir cython  
RUN python3 -m pip install --upgrade pip && python3 -m pip install -r pip3_req.txt  
RUN git clone https://github.com/dmitrysarov/vim_install.git && cd vim_install && ./install_vim.sh && ./config.sh && cd - && rm -r vim_install
COPY jupyter_config /root/.jupyter/jupyter_notebook_config.json
# Everything on this line is a comment
#ENV TERM=screen-256color 
RUN echo "export TERM=screen-256color" >> /root/.bash_profile
