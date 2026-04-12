-- Throw an exception when one or two of the operands are not a number.
local function typecheck(op1, op2)
    if type(op1) ~= "number" and type(op2) ~= "number" then
        error(string.format("Both operands are not numbers! Instead got type %s and %s", type(op1), type(op2)))
    elseif type(op1) ~= "number" then
        error(string.format("Operand 1 is not a number! Instead got type %s", type(op1)))
    elseif type(op2) ~= "number" then
        error(string.format("Operand 2 is not a number! Instead got type %s", type(op2)))
    end
end

-- Define a list of valid operations and their callbacks, but throw an error if invalid.
return setmetatable({
    ["+"] = function(op1, op2)
        typecheck(op1, op2)
        return op1 + op2
    end,
    ["-"] = function(op1, op2)
        typecheck(op1, op2)
        return op1 - op2
    end,
    ["*"] = function(op1, op2)
        typecheck(op1, op2)
        return op1 * op2
    end,
    ["/"] = function(op1, op2)
        typecheck(op1, op2)
        if op2 == 0 then error("Second operand cannot be 0!") end -- Check against division by zero
        return op1 / op2
    end,
    ["//"] = function(op1, op2)
        typecheck(op1, op2)
        if op2 == 0 then error("Second operand cannot be 0!") end
        return math.floor(op1 / op2)
    end,
    ["^"] = function(op1, op2)
        typecheck(op1, op2)
        return op1^op2
    end,
    ["%"] = function(op1, op2)
        typecheck(op1, op2)
        return op1 % op2
    end
}, {
    ["__index"] = function(self, operation)
        error(string.format("'%s' is not a valid operation!", operation))
    end
})