# Container with the eclipse/repast-simphony runtime libraries, python and ant
# only built once (or on update of the plugins)
FROM adoptopenjdk/openjdk11:debian-slim AS sim-build
RUN apt-get update && apt-get install --no-install-suggests --no-install-recommends --yes wget unzip ant
# download and unzip the eclipse plugins needed to run and build the simulation
RUN wget https://cloud.dfki.de/owncloud/index.php/s/MGPQsMM3a6ZRi2H/download/plugins.zip \
    && unzip plugins.zip \
    && rm -rf plugins.zip

# Copy of the sim-build Container with the pyhton venv, the simulation and server code
# built when the server or the simulation is updated
FROM sim-build AS service-runner
# copy the simulation code and sensitive data
COPY . /JZombies_Demo
# build the simulation by executing the build target from the build.xml
WORKDIR /JZombies_Demo
RUN ant build "-Dplugins_loc=/" "-Dmodel_loc=./JZombies_Demo.rs"

EXPOSE 5000
CMD ant run-server "-Dplugins_loc=/" "-Dmodel_loc=./JZombies_Demo.rs"
