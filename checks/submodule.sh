#!/usr/bin/env bash

git submodule foreach --quiet 'git submodule update --quiet --init --recursive --remote'

echo -n '{"name":"Update submodules","branch":"cultivator/submodules","body":"Keep git submodules up to date","commit_msg":"update submodules"}'

