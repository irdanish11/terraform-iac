import psycopg2
from typing import Tuple
from sshtunnel import SSHTunnelForwarder

# Type Aliases
Connection = psycopg2.extensions.connection
TunnelConnection = Tuple[SSHTunnelForwarder, Connection]


def get_tunnel_db_connection(bastion_host_ip: str, bastion_user: str,
                             bastion_pkey: str, db_name: str, db_password: str,
                             db_user: str, rds_host: str) -> TunnelConnection:
    bastion_port = 22
    rds_port = 5432
    server = SSHTunnelForwarder(
        (bastion_host_ip, bastion_port),
        ssh_username=bastion_user,
        ssh_pkey=bastion_pkey,
        remote_bind_address=(rds_host, rds_port))
    server.start()
    connection = psycopg2.connect(
        host="127.0.0.1",
        port=server.local_bind_port,
        dbname=db_name,
        password=db_password,
        user=db_user
    )
    return server, connection


# creates the tunnel and connection to the database
tunnel, conn = get_tunnel_db_connection(
    bastion_host_ip="<public-ipv4-ec2-bastion-host>",
    bastion_user="ec2-user",
    bastion_pkey="path/to/key/ec2-bastion-key-pair.pem",
    db_name="postgres",
    db_password="<db-password>",
    db_user="infrafypostgres",
    rds_host="rds-endpoint"
)

# execute the query
cursor = conn.cursor()
cursor.execute('SELECT datname FROM pg_database')
result = cursor.fetchall()
print(f"Result: \n{result}")
# close the tunnel
tunnel.stop()
