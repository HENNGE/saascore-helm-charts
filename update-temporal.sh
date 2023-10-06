#!/bin/bash

main() {
	set -eu

	curl -L -O https://github.com/temporalio/helm-charts/archive/v1.21.5.zip
	unzip v1.21.5.zip
	rm v1.21.5.zip
	mv helm-charts-1.21.5 temporal

	cd temporal
	helm dependencies update
	cd ../
	helm package temporal
	helm repo index .
}

main "${@}"
