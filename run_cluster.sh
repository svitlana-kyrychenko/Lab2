docker network create my-cassandra-network
docker run --name cassandra-node1 --network my-cassandra-network -d cassandra:latest
docker run --name cassandra-node2 --network my-cassandra-network -d -e CASSANDRA_SEEDS=cassandra-node1 cassandra:latest
docker run --name cassandra-node3 --network my-cassandra-network -d -e CASSANDRA_SEEDS=cassandra-node1 cassandra:latest
docker run -p 8081:80 -it --network my-cassandra-network --rm cassandra cqlsh cassandra-node1