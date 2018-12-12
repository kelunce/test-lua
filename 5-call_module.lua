#!/bin/env lua

--require 有它自己的文件路径加载策略，它会尝试从 Lua 文件或 C 程序库中加载模块。
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
print(f_bin2hex(f.sum("xxxx"))) --EA416ED0759D46A8DE58F63A59077499
