#!/usr/bin/env bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LUA_PATH="${LUA_PATH:+$LUA_PATH;}$dir/?.lua" luajit Main.lua