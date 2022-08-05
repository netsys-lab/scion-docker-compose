# SCION Docker-Compose Scripts
This repo contains tooling to use an adapted version of SCION's topogen to generate working docker-compose topologies. It contains one Dockerfile for a `topogen` container that you can run to generate the topology (so no need to fork my scion branch) and containers for the SCION `control` `router` and `daemon`.

## Get Started
At first, you need to build all containers, so run `./build-containers.sh`. This may take a few minutes.

To generate a topology, use the `topogen` container the following way:

- `mkdir gen`
- `docker run -v $(pwd)/sample.topo:/share/topology.json -v $(pwd)/gen:/share/output topogen`

**Note:** Just change sample.topo with any topology you want to use. But do not change the second docker volume, this needs to be always `gen`.

Inside `gen` you now have the complete SCION topology including a `docker-compose.yml` file. You can run the topology with:
- `cd gen`
- `docker-compose up -d`

To ensure all containers are running use `docker ps` the output should look similar to this:
```
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS     NAMES
5cd509f283d7   daemon         "bash /root/run.sh /…"   21 seconds ago   Up 18 seconds             gen_scion_sd1-ff00_0_111_1
9b60e89a9376   posix-router   "/root/router --conf…"   21 seconds ago   Up 17 seconds             gen_scion_br1-ff00_0_110-2_1
3638360a31c6   posix-router   "/root/router --conf…"   21 seconds ago   Up 17 seconds             gen_scion_br1-ff00_0_110-1_1
e838d7dd36d6   control        "bash /root/run.sh /…"   21 seconds ago   Up 18 seconds             scion_cs1-ff00_0_110-1
cf3f6e6cdf7b   control        "bash /root/run.sh /…"   21 seconds ago   Up 17 seconds             scion_cs1-ff00_0_112-1
a12d0c1e02a5   control        "bash /root/run.sh /…"   21 seconds ago   Up 18 seconds             scion_cs1-ff00_0_111-1
4adfc56487e8   daemon         "bash /root/run.sh /…"   21 seconds ago   Up 17 seconds             gen_scion_sd1-ff00_0_112_1
53566a938538   posix-router   "/root/router --conf…"   21 seconds ago   Up 17 seconds             gen_scion_br1-ff00_0_111-1_1
2818f9887599   daemon         "bash /root/run.sh /…"   21 seconds ago   Up 18 seconds             gen_scion_sd1-ff00_0_110_1
6ef06a0c6957   posix-router   "/root/router --conf…"   21 seconds ago   Up 17 seconds             gen_scion_br1-ff00_0_112-1_1
```

You can now test connectivity. The `daemon` containers have the `scion` binary inside it. So you can run `showpaths` inside them. To execute something inside a container, choose the CONTAINER ID of a daemon container (in my case `5cd509f283d7` for the daemon in `ff00_0_111_1`) and run `docker exec -it 5cd509f283d7 /bin/bash`.

Now you can do something like `scion showpaths 1-ff00:0:112` and it should output paths. The correct `SCION_DAEMON` env should be set for each daemon container.

To shut down the topology, run `docker-compose down`. **Note:** It's essential to stop the containers and remove the networks, otherwise you may encounter strange errors...

## Troubleshooting
- I only tested this with small topologies so far (e.g. tiny.topo), so there may be issues with large topologies.
- The `daemon` and `control` containers run the SCION dispatcher in the background, which may crash without notice. You can then inspect the log of the container and restart it.
- If you encounter errors that indicate that networks are already in use, ensure that you did `docker-compose down` or remove networks manually.