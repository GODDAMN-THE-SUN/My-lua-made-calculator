local Operations = require("Operations")
local FFI = require("ffi")
FFI.cdef [[void Sleep(unsigned long ms)]] -- we use luajit foreign function interface because i am not bothering with os.execute()

FFI.C.Sleep(1000)
print("Thanks for using..")
FFI.C.Sleep(1500)
print("T H E  C A L C U L A T O R .")
FFI.C.Sleep(2000)

print("First number/operand:")
local Operand1 = tonumber(io.read())

print("Second number/operand:")
local Operand2 = tonumber(io.read())

print("Lastly, what operation do you wanna do? [+ - * / // ^ %]")
local Operation = tostring(io.read())

print("Result: " .. tostring(Operations[Operation](Operand1, Operand2)))