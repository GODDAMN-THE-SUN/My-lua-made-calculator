$oldLuaPath = $env:LUA_PATH
$env:LUA_PATH = "$env:LUA_PATH;$PSScriptRoot\?.lua"
luajit Main.lua
$env:LUA_PATH = $oldLuaPath