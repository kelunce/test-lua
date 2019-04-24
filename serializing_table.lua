local function basicSerialize(o)
    if type(o) == 'number' then
        return tostring(o)
    else    --assume it is a string
        --q 选项将一个字符串格式化为两个双引号括起，对内部字符做恰当的转义处理的字符串
        return string.format("%q", o) --%q
    end
end

local insert = table.insert
local function save(name, value, saved, content)
    local tbl_saved = saved or {}
    insert(content, name..' = ') --io.write(name, ' = ')
    if type(value) == 'number' or type(value) == 'string' then
        insert(content, basicSerialize(value)..'\n') --io.write(basicSerialize(value), '\n')
    elseif type(value) == 'table' then
        if tbl_saved[value] then
            insert(content, tbl_saved[value]..'\n')--io.write(save[value], '\n')
        else
            tbl_saved[value] = name     -- 以table为key记录已经或者正在序列化过的表
            insert(content, '{}\n')--io.write('{}\n')
            for k, v in pairs(value) do
                k = basicSerialize(k)
                local fname = string.format("%s[%s]", name, k)
                save(fname, v, tbl_saved, content) --进入递归, 实现了类似深度遍历的效果
            end
        end
    else
        error("cannot save a "..type(value))
    end
end

local a = {{'one', 'two'}, 3}
local b = {k = a[1]}

local ret = {}
save("a", a, {}, ret)
--> a = {}
--> a[1] = {}
--> a[1][1] = "one"
--> a[1][2] = "two"
--> a[2] = 3
save("b", b, {}, ret)
--> b = {}
--> b["k"] = {}
--> b["k"][1] = "one"
--> b["k"][2] = "two"
io.write(table.concat(ret))

print('\n-----------\n')

local history = {}
ret = {}
save('a', a, history, ret)
--> a = {}
--> a[1] = {}
--> a[1][1] = "one"
--> a[1][2] = "two"
--> a[2] = 3
save('b', b, history, ret)
--> b = {}
--> b["k"] = a[1]


io.write(table.concat(ret))
