FROM python:3.5

ENV PYTHONPATH "/usr/lib/python3/dist-packages:/usr/local/lib/python3.7/site-packages"

# Install dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y \
    && apt-get install -y \
        gcc \
        build-essential \
        zlib1g-dev \
        wget \
        unzip \
        cmake \
        python3-dev \
        gfortran \
        libblas-dev \
        liblapack-dev \
        libatlas-base-dev \
    && apt-get clean

RUN pip install --upgrade pip

WORKDIR /src

COPY requirements.txt .

RUN pip install -U -r requirements.txt

COPY . .