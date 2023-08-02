
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic payment-request --delete --if-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic payment-response --delete --if-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic restaurant-approval-request --delete --if-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic restaurant-approval-response --delete --if-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic customer --delete --if-exists

kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic payment-request --create --if-not-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic payment-response --create --if-not-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic restaurant-approval-request --create --if-not-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic restaurant-approval-response --create --if-not-exists
kafka-topics --create --bootstrap-server bitnami-kafka-headless:9092 --replication-factor 1 --partitions 1 --topic customer --create --if-not-exists
