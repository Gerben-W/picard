# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-20.04-v4

# Install dependencies
RUN apt update && apt upgrade -y
RUN apt install -y \
            software-properties-common

# Install Picard.
RUN add-apt-repository -y ppa:musicbrainz-developers/stable
RUN apt update
RUN apt install -y picard

# Cleanup
RUN apt autoclean

# Copy the start script.
COPY startapp.sh /startapp.sh

RUN ls /

# Set the name of the application.
RUN set-cont-env APP_NAME "Picard"