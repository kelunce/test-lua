#!/usr/bin/env lua
for i = 1, 3 do
    print('pow:',i^2)
    local t = 100
    print("test var t:", t + i)
    --一个代码块
    do
        if i%2 == 0 then goto continue end
        local a = 10
        print("test var a:",a + i)
    end
    ::continue::
end

--只循环一次
local errno,msg
repeat
    if os.time()%2 == 1 then
        errno = i
        msg = "found not 2 times"
        break
    end
    msg = "found 2 times"
until true  --until的判定语句中可以使用repeat里面的局部变量
print("test end. ", msg)
