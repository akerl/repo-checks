#!/usr/bin/env bash

git submodule foreach 'git pull && git submodule update --init --recursive'

echo -n '{"name":"Update submodules","branch":"cultivator/submodules","body":"Keep git submodules up to date","commit_msg":"update submodules"}'

