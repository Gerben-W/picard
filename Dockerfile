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

# Generate and install favicons.
RUN APP_ICON_URL=https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/MusicBrainz_Picard_logo.svg/1806px-MusicBrainz_Picard_logo.svg.png && \
    install_app_icon.sh "$APP_ICON_URL"

# Cleanup
RUN apt autoclean

# Copy the start script.
COPY startapp.sh /startapp.sh

# Set the name of the application.
RUN set-cont-env APP_NAME "Picard"
