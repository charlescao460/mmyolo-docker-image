FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# Install Python & pip & other dependencies
RUN apt update
RUN apt install python3.10 python3.10-distutils -y
RUN apt install ffmpeg libsm6 libxext6 curl -y
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
RUN update-alternatives --config python
RUN curl https://bootstrap.pypa.io/get-pip.py | python -

# Install PyTorch && MMLabs 
RUN pip install torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118
RUN pip install -U openmim
RUN mim install "mmengine>=0.6.0"
RUN mim install "mmcv>=2.0.0rc4,<2.1.0"
RUN mim install "mmdet>=3.0.0,<4.0.0"