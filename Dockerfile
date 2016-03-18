FROM python:3.5
MAINTAINER Piter Oliveira Vergara <piter.vergara@code4fun.com.br>

# Update and install packages recomended by Django documentation:
# https://docs.djangoproject.com/ja/1.9/ref/contrib/gis/install/geolibs/
# and extra needed packages
RUN apt-get update -y && \
    apt-get install --auto-remove -y \
    binutils \
    libproj-dev \
    gdal-bin \
    postgis \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install nodejs 4.x
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && apt-get install --yes nodejs

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
