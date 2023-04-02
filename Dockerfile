FROM python:3.9-slim-buster

RUN apt-get update && \
    apt-get install -y libgomp1 curl && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install \
    jupyterlab \
    jupyterlab-language-pack-fr-fr

COPY requirements.txt /opt/requirements.txt
RUN pip install -r /opt/requirements.txt

ENV NOTEBOOK_DIR=/opt/notebooks

CMD ["jupyter-lab", \
    "--notebook-dir=/opt/notebooks", \
    "--ip=0.0.0.0", \
    "--NotebookApp.token=''", \
    "--NotebookApp.password=''", \
    "--port=8888", \
    "--no-browser", \
    "--allow-root"]
