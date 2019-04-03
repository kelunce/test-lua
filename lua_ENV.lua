#!/usr/bin/env lua
--先保存引用
local print

a = 13
local a = 12
print("local a:", a)
print("global _G.a:", _G.a)
print("global _ENV.a:", _ENV.a)

_ENV = {}
b = 90 --> 在_ENV中创建b元素
local b = 9
print("local b:", b)    -->9, print因为之前存有引用，所以这里可以访问
--print("global _G.b:", _G.b)   此时_G也是不可访问的
print("global _ENV.b:", _ENV.b) -->90



