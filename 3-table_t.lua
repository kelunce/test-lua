#!/bin/env lua
-- table类型, key可以不定义，则从1开始计算， 如果key是数值，则要方括号
tab1 = { key1 = "val1", key2 = "val2", "val3", ["key4"] = "val4", [8] = 1 }
-- 遍历
for k, v in pairs(tab1) do
    print(type(k) .." ".. k .. " -> " .. v)
end
-- sizeof table , 等效于table.getn
print("sizeof table = " .. #tab1)
--[[    output:
number 1 -> val3
string key2 -> val2
number 8 -> 1
string key4 -> val4
string key1 -> val1
sizeof table = 1
]]


-- 初始化数组,当作数组使用
array = {}
maxRows = 3
maxColumns = 3
print("--------init table------------")
for row=1,maxRows do
    for col=1,maxColumns do
        local idx = row*maxColumns +col 
        array[idx] = row*col
        print(string.format("idx = %d, value = % d", idx, array[idx]))
    end
end
--[[    output:
idx = 4, value =  1
idx = 5, value =  2
idx = 6, value =  3
idx = 7, value =  2
idx = 8, value =  4
idx = 9, value =  6
idx = 10, value =  3
idx = 11, value =  6
idx = 12, value =  9
]]


array[100] = 100
-- 访问数组
print("--------use pairs------------")
for k, v in pairs(array) do
    print(type(k) .." ".. k .. " -> " .. v)
end
-- sizeof table
print("sizeof array = " .. #array)

--[[    output:
number 4 -> 1
number 5 -> 2
number 6 -> 3
number 7 -> 2
number 8 -> 4
number 9 -> 6
number 10 -> 3
number 11 -> 6
number 12 -> 9
number 100 -> 100
sizeof array = 12
--]]


-- test ipair(从1开始，到++后没有元素，故这里没有一个匹配的)
print("------------ipairs------------")
for k, v in ipairs(array) do
    print(type(k) .." ".. k .. " -> " .. v)
end
--[[    output:
]]



print("------------test null table---")

table_a = {}
if next(table_a) == nil then
    print("null table")
end
--[[    output:
null table
]]


print("--------remove array in traverse--")
local array = {"a", "a","a","b","a","a","b"}
for i=#array,1,-1 do
    if array[i] == "a" then
        table.remove(array, i)
    end
end

for i,v in ipairs(array) do
    print(i,v)
end
--[[    output:
1       b
2       b
]]

print("----------数组连接测试----------")
fruits = {"banana","orange","apple"}
print("连接后的字符串 ",table.concat(fruits,", ")) --连接后的字符串  banana, orange, apple
print("连接后的字符串 ",table.concat(fruits,", ", 2,3)) --连接后的字符串  orange, apple
fruits = {"banana","orange","apple"}

print("---------数组的插入测试--------")
-- 在末尾插入
table.insert(fruits,"mango")
print("索引为 4 的元素为 ",fruits[4])

-- 在索引为 2 的键处插入
table.insert(fruits,2,"grapes")
print("索引为 2 的元素为 ",fruits[2])
print("最后一个元素为 ",fruits[5])
table.remove(fruits)
table.sort(fruits)
print("移除最后一个元素,并排序后")
for i,v in ipairs(fruits) do
    print(i,v)
end

