ARG COSMOS_IMAGE
FROM $COSMOS_IMAGE

ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN sudo apt-get update && \
    sudo apt-get install -y git && \
    git clone --recursive https://github.com/tensorflow/docs.git && \
    :

WORKDIR "docs/site/en"
COPY --chown=$MAMBA_USER:$MAMBA_USER ./tensorflow/ ./
RUN chmod +x run_tensorflow_example_notebooks.sh

RUN micromamba install -y conda-forge::papermill nvidia::cuda-nvcc
ENV XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/conda

CMD ["./run_tensorflow_example_notebooks.sh"]
