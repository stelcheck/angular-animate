#!/bin/bash

set -e # fail if any command fails
cd `dirname $0`/../..

# Build
./jenkins_build.sh

# Update code.angularjs.org
VERSION=`cat build/version.txt`
curl -G --data-urlencode 'ver=$VERSION' http://code.angularjs.org/fetchLatestSnapshot.php

# Push to bower
./scripts/bower/publish.sh