local Operations = require("Operations")
local FFI = require("ffi")

local sleep;
if FFI.os == "Windows" then
    FFI.cdef [[void Sleep(unsigned int ms);]]
    sleep = function(ms) FFI.C.Sleep(ms) end
else
    FFI.cdef [[int usleep(unsigned int usec);]]
    sleep = function(ms) FFI.C.usleep(ms * 1000) end
end

sleep(1000)
print("Thanks for using..")
sleep(1500)
print("T H E  C A L C U L A T O R .")
sleep(2000)

print("First number/operand:")
local Operand1 = tonumber(io.read():gsub("%s+", ""))

print("Second number/operand:")
local Operand2 = tonumber(io.read():gsub("%s+", ""))

print("Lastly, what operation do you wanna do? [+ - * / // ^ %]")
local Operation = tostring(io.read()):gsub("%s+", "")

print("Result: " .. tostring(Operations[Operation](Operand1, Operand2)))
