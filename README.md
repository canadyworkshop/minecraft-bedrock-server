# canadyworkshop/minecraft-bedrock-server

The minecraft-bedrock-server image provides a working Minecraft Bedrock server with the normal 19132/tcp port exposed. The version of Minecraft Bedrock is determeind by the version of the container you deploy. 

## Configuration

The configuration should be provided by injecting configuration files to replace as needed. All files are located at the root of the container. 

|File|Location|
|----|--------|
|server.properties|/server.properties|
|allowlist.json|/allowlist.json|

### Docker example using mounts

* The server configuration file is provided from the local file system.
* The worlds directory is provided by the local file system.
* This is just one option, docker volumes could also be used for example.
* This command is running the latest version.

```
docker run \
    --name=<your_chosen_container_name> \
    --mount type=bind,source=<path_to_worlds_dir>,target=/worlds \
    --mount type=bind,source=<path_to_server_config_file>/server.properties,target=/server.properties minecraft-bedrock-server:latest
```