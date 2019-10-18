FROM python:alpine

# Install required packages
RUN apk add --update --virtual=.build-dependencies alpine-sdk nodejs ca-certificates musl-dev gcc python-dev make cmake g++ gfortran git libpng-dev freetype-dev libxml2-dev libxslt-dev

# Install Jupyter and JupyterLab
RUN pip install jupyter
RUN pip install jupyterlab


# Expose Jupyter port & cmd
EXPOSE 8888
RUN mkdir -p /opt/app/data
CMD jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root
