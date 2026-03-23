FROM intersystems/irishealth-community:2025.3

# Copy key file
# COPY iris.key /usr/irissys/mgr/iris.key

# Create local folder for the application owned by user [ irisowner ]
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} . /irisdev/app/

# Install python requirements
RUN python3 -m pip install -r /irisdev/app/requirements.txt --break-system-packages

# Run init commands after IRIS starts
CMD ["--after", "/irisdev/app/scripts/init.sh"]