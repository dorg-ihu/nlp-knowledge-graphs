# nlp-knowledge-graphs
National Regiristy of Greece - NLP &amp; Knowledge Graphs


## Setup of Neo4j (5.11) on Ubuntu Linux Server
- [ ] Install Java 17.
    - Type the following commands in the cmd
    ```
    sudo apt update
    sudo apt upgrade
    sudo apt install openjdk-17-jre
    sudo apt install openjdk-17-jdk
    ```
    - Confirm the installation
    ```
    java --version
    ```
- [ ] Install Neo4j Server
    - Add the repository
    ```
    wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
    echo 'deb https://debian.neo4j.com stable latest' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
    sudo apt-get update
    ```
    - Install Neo4j Community Edition
    ```
    sudo apt-get install neo4j=1:5.11.0
    ```
- [ ] Configure neo4j.conf file
    - Specify the path for data, plugins, logs, lib, etc (if needed when having an attached disk with more space)
    ```
    server.directories.data=/mt/vdb1/neo4j-lib/data
    server.directories.plugins=/mt/vdb1/neo4j-lib/plugins
    server.directories.logs=/var/log/neo4j
    server.directories.lib=/usr/share/neo4j/lib
    #server.directories.run=run
    #server.directories.licenses=licenses
    #server.directories.transaction.logs.root=data/transactions
    ```
    - Uncomment the following line in the network section to allow remote connections
    ```
    server.default_listen_address=0.0.0.0
    ```
    - Add the list of allowed procedures to be used (e.g. graph data science library and apoc)
    ```
    dbms.security.procedures.unrestricted=my.extensions.example,my.procedures.*,gds.*, apoc.*
    ```
- [ ] Install the additional plugins (GDS, APOC Core, APOC Extended)
    - Install APOC Core
        - Go the the $NEO4J_HOME folder. By default, it should be /var/lib/neo4j.
        - Go to the labs folder and copy the jar file to the plugins folder according to the path defined in neo4j.conf file.
    - Install APOC Extended
        - Download the jar file with the same version (5.11) from the [Github repo](https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/)
        - Move it to the plugins folder
    - Install Graph Data Science library
        - Download the Zip file from the [Neo4j Download Center](https://neo4j.com/download-center/#ngds)
        - Unzip the archive and move it to the plugins folder


## Setup of NeoDash Editor
- [ ] Install Docker Engine. More information can be found in the [Docker documentation](https://docs.docker.com/engine/install/ubuntu/).
    - Set up Docker's Apt repository.
    ```
    # Add Docker's official GPG key:
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add the repository to Apt sources:
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    ```
    - Install the Docker packages.
    ```
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```
    - Verify that the Docker Engine installation is successful by running the hello-world image.
    ```
    sudo docker run hello-world
    ```
- [ ] Install and run NeoDash (Editor mode). More information can be found at [NeoDash documentation](https://neo4j.com/labs/neodash/2.2/developer-guide/build-and-run/#_run_locally_with_docker).
```
# Run the application on http://<hostname>:5005
docker pull neo4jlabs/neodash:latest
docker run -it --rm -p 5005:5005 neo4jlabs/neodash
```


