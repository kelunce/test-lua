#!/bin/env lua
-- 单行注释
print(_VERSION)

--[[
  多行注释
  多行注释
]]
print("Hello World!")

--变量不要类型定义,只需要为变量赋值
-- 全局变量
b = 100

-- concatenate string and int
print('b = '..b)

-- string format
msg = string.format("string format test. Hello from (%%s) %s on (%%s)%s\n", _VERSION, os.date())
print(msg)

-- 销毁
b = nil
