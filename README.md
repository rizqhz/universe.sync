<h3 align="center">
    <pre>universe.sync</pre>
</h3>

<div align="center">
    <em>"A Local Backend Services Stack Powered by Docker Compose"</em>
</div>

<h6 align="center">
    <samp>• • •</samp>
</h6>

### Overview

<div align="justify">

This project provides a containerized environment for the supporting services commonly used in **backend** development, isolated from the host machine's primary environment. The goal is to make services such as databases, caches, and message brokers reusable without having to install them and manually reconfigure each machine.

</div>

<div align="justify">

These backend services are managed with **Docker Compose** and connected to a shared network so they can communicate with one another. Because the services run in isolated containers, the host machine cannot necessarily access them directly. A gateway is therefore needed to bridge the host and these services, and a **reverse proxy** can serve that role. **Nginx** is one option for implementing this reverse-proxy layer.

</div>

<div align="justify">

Nginx acts as the main entry point for accessing backend services from the local machine. For example, it can provide access to a **MySQL** database server over **TCP** port **3306**, a **Redis** cache over **TCP** port **6379**, or web-based admin panels for managing a **PostgreSQL** database through **HTTP** on port **80**.

</div>

<h6 align="center">
    <samp>• • •</samp>
</h6>

### Features and Services

<div align="justify">

This project consolidates the Docker Compose configuration for each service into the root-level `compose.yaml` file.

</div>

| Service    | Purpose                             |  Container Name            |
|------------|-------------------------------------|----------------------------|
| Nginx      | Web Server dan HTTP Reverse Proxy   | `universe.proxy.server`    |
| MySQL      | Relational Database                 | `universe.db.mysql.server` |
| phpMyAdmin | MySQL Administration Panel          | `universe.db.mysql.panel`  |
| PostgreSQL | Relational Database                 | `universe.db.pgsql.server` |
| pgAdmin    | PostgreSQL Administration Panel     | `universe.db.pgsql.panel`  |
| MongoDB    | Document Database                   | `universe.db.mongo.server` |
| Redis      | Cache and Data Structure Store      | `universe.cache.redis`     |
| Memcached  | In-Memory Caching                   | `universe.cache.memcached` |
| RabbitMQ   | Message Broker                      | `universe.broker.rabbitmq` |
| Kafka      | Event Streaming and Message Broker  | `universe.broker.kafka`    |

<div align="justify">

The current configuration defines the Docker network `universe.domain`, service health checks, the `unless-stopped` restart policy, and persistent data storage in the host directory `/docker`.

</div>

<h6 align="center">
    <samp>• • •</samp>
</h6>

### Prerequisites

- **Linux** or a Linux shell environment such as **WSL2**, with access to **Docker Engine**.
- **Docker Engine** and the **Docker Compose** plugin with support for the `include` attribute (**Docker Compose** `>=2.20.3`).
- **Bash** and `sudo` privileges to create directories under `/docker`.
- Host port `80` must be available for Nginx.

Check that Docker and Docker Compose are installed:

```bash
💲 docker --version
💲 docker compose version
```

<h6 align="center">
    <samp>• • •</samp>
</h6>

### How to run?

```bash
💲 sudo make world-set
💲 sudo make world-del
```

<div align=center>
    <samp><a href="#readme">BACK TO TOP</a></samp>
</div>

<h1></h1>

<samp align=left>Work in Progress.</samp>
