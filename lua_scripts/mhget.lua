--
-- Created by IntelliJ IDEA.
-- User: chenjian
-- Date: 2020/6/21
-- Time: 7:04 下午
-- To change this template use File | Settings | File Templates.
--

--local KEYS = { "a", "b", "c" }
--local ARGV = {1,2,3}
local result = {}
if (#ARGV == 0) then
    return result
end
for i, key in ipairs(KEYS) do
    local v = redis.pcall("hmget", key, unpack(ARGV))
    result[i] = v
end
return result

