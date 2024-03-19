#!/bin/bash

main() {
	set -eu

	temporal_ver=0.34.0

	curl -L -O https://github.com/temporalio/helm-charts/archive/temporal-${temporal_ver}.zip
	unzip temporal-${temporal_ver}.zip
	rm temporal-${temporal_ver}.zip
	mv helm-charts-temporal-${temporal_ver} temporal_${temporal_ver}

	cd temporal_${temporal_ver}/charts/temporal
	helm dependencies update
	cd ../../..
	helm package temporal_${temporal_ver}/charts/temporal
	helm repo index .
}

main "${@}"
