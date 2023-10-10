#!/bin/bash

main() {
	set -eu

	temporal_ver=1.14.5

	curl -L -O https://github.com/temporalio/helm-charts/archive/v${temporal_ver}.zip
	unzip v${temporal_ver}.zip
	rm v${temporal_ver}.zip
	mv helm-charts-${temporal_ver} temporal_${temporal_ver}

	cd temporal_${temporal_ver}
	helm dependencies update
	cd ../
	helm package temporal_${temporal_ver}
	helm repo index .
}

main "${@}"
