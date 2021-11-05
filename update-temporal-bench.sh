#!/bin/bash

main() {
	set -eu

	rm -rf ./temporal-bench
	rm -f ./temporal-bench-0.1.0.tgz

	curl -L -O https://github.com/temporalio/maru/archive/refs/tags/v0.2.0.zip
	unzip v0.2.0.zip
	rm v0.2.0.zip
	mv maru-0.2.0/helm-chart temporal-bench
	rm -r maru-0.2.0

	cd temporal-bench
	helm dependencies update
	cd ../
	helm package temporal-bench
	helm repo index .
}

main "${@}"
