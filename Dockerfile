FROM raghuram369/objectdetection
MAINTAINER Raghuram Parvataneni <raghuram369@gmail.com>


RUN pip install prometheus_client
# Copy the current directory contents into the container at /app
ADD . /code

WORKDIR /code
EXPOSE 5000


# Start x11vnc
ENTRYPOINT ["/usr/bin/python", "server.py"]
#CMD ["/usr/bin/lxterminal"]
#CMD [ "/usr/bin/python",  "./server.py" ]