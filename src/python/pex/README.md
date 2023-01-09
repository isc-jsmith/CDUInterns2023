# Example PEX Business Operation in Python

Example_operation.py is a (very simple) example of a business operation written in Python
which is run as Production EXtension (PEX).

Steps to configure:

* Make sure your environment supports Python Virtual Enviroments. Steps can vary between platforms.

        ```console
        AUMBPJSMITH:~ jsmith$ docker exec -it -u 0 CDUINTERNS /bin/bash
        root@e1e70065ce4d:/home/irisowner# apt update
        root@e1e70065ce4d:/home/irisowner# apt install python3-venv
        ```

* Install imagemagic libraries in your environments. For example in an Ubuntu Container:

        ```console
        root@e1e70065ce4d:/home/irisowner# apt-get install imagemagick
        root@e1e70065ce4d:/home/irisowner# pip3 install wand
        ```

* Start the Python External Language Server:
  * Open the IRIS Management Portal and navigate to System Administration -> Configuration -> Connectivity -> External Language Servers.
  * Click on "Start" in the row that contains "%Python Server".
  * If you see a permissions error, try opening a terminal session and changing the permissions of the directory "virtual" that sits under $IRISDIR/dev/python:

        ```console
        root@e1e70065ce4d:/home/irisowner# cd /usr/irissys/dev/python
        root@e1e70065ce4d:/usr/irissys/dev/python# chmod a+w ./virtual/
        ```
* In the environment where you will be developing the PEX component, get the irispython wheel from $IRISDIR/dev/python and install it:

        ```console
        pip3 install intersystems_irispython-3.2.0-py3-none-any.whl
        ```
