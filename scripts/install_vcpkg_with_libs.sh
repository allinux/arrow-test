#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -e

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 ``<target-directory> [<vcpkg-version> [<vcpkg-ports-patch>]]"
  exit 1
fi

arrow_dir=$(cd -- "$(dirname -- "$0")/../.." && pwd -P)
default_vcpkg_version=2023.08.09


vcpkg_destination=$1
vcpkg_version=${2:-$default_vcpkg_version}
vcpkg_ports_patch=${3:-$default_vcpkg_ports_patch}

git clone -b 2023.08.09 https://github.com/microsoft/vcpkg ${vcpkg_destination}

pushd ${vcpkg_destination}

./bootstrap-vcpkg.sh -disableMetrics

./vcpkg install 'arrow[core,csv,filesystem,json,parquet,s3]'
popd