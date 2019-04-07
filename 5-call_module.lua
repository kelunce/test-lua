#!/bin/env lua

--require 有它自己的文件路径加载策略，它会尝试从 Lua 文件或 C 程序库中加载模块。
--通过监视loaded发现新加载的模块
setmetatable(package.loaded, {__newindex = function(t, k, v)
    print("***load new mod:"..tostring(k))
    rawset(t, k, v)
end})

require("4-module")
--package.loaded["4-module"] = nil
require("4-module")

print(module.constant)
module.func3()
module.constant = "I am a constant var"

local m = require("4-module")
print(m.constant)

-- 导入so库(来自skynet)
local function f_bin2hex(s)
    s=string.gsub(s,"(.)",function (x) return string.format("%02x",string.byte(x)) end)
    return s
end

local f = require("md5.core")
print("md5sum(xxxx)=",f_bin2hex(f.sum("xxxx"))) --EA416ED0759D46A8DE58F63A59077499


--print("requre md5 mode ret:", f)
--for k,v in  pairs(f) do
--    print(k, v)
--end
