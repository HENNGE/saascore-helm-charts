#!/bin/bash

main() {
	set -eu

	rm -rf ./temporal
	rm -f ./temporal-0.2.2.tgz

	curl -L -O https://github.com/temporalio/helm-charts/archive/v1.13.0.zip
	unzip v1.13.0.zip
	rm v1.13.0.zip
	mv helm-charts-1.13.0 temporal

	cd temporal
	helm dependencies update
	cd ../
	helm package temporal
	helm repo index .
}

main "${@}"
