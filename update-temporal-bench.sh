#!/bin/bash

main() {
	set -eu

	rm -rf ./temporal-bench
	rm -f ./temporal-bench-0.1.0.tgz

	curl -L -O https://github.com/temporalio/maru/archive/refs/heads/master.zip
	unzip master.zip
	rm master.zip
	mv maru-master/helm-chart temporal-bench
	rm -r maru-master

	cd temporal-bench
	helm dependencies update
	cd ../
	helm package temporal-bench
	helm repo index .
}

main "${@}"
