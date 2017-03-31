#!/bin/bash
set -ex

echo $(dart --version)
dartfmt -n --set-exit-if-changed lib/
dartanalyzer --fatal-warnings lib/