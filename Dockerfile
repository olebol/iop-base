FROM intersystems/irishealth-community:latest-em

# Copy key file
# COPY iris.key /usr/irissys/mgr/iris.key


# Create local folder for the application owned by user [ irisowner ]
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} . /irisdev/app/

# Set up irispython path
USER ${ISC_PACKAGE_MGRUSER}
ENV PATH="$PATH:/usr/irissys/bin"


# Set up IOP (seems to be unnecessary?)
# ENV IRISUSERNAME="SuperUser"
# ENV IRISPASSWORD="SYS"
# ENV IRISNAMESPACE="USER"

# ENV PYTHON_PATH=/usr/irissys/bin
# ENV IRISINSTALLDIR="/opt/iris"
# ENV LD_LIBRARY_PATH="/opt/iris/bin:$LD_LIBRARY_PATH"

# Run startup script
RUN /irisdev/app/scripts/start.sh