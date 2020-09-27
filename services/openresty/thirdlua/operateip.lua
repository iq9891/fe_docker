-- author chenjian@eventmosh.com
-- 此列表需要全匹配 '111.111.111.111'
local white_list = {
};
-- 此列表只需要匹配前两位 '111.111'
local white_list_16 = {
}
-- 此列表只需要匹配前三位 '111.111.111'
local white_list_24 = {
}

local function ignoreWhitelist(ip)
    local tips = false;
    for key,value in ipairs(white_list)
    do
        if ip == value then
            tips = true
        end 
    end
    return tips;
end

local function get_client_ip()
    local headers=ngx.req.get_headers()
    local ip=headers["X-REAL-IP"] or headers["X_FORWARDED_FOR"] or ngx.var.remote_addr or "0.0.0.0"
    return ip
end

local function string_split(input, delimiter)
    input = tostring(input)
    delimiter = tostring(delimiter)
    if (delimiter=='') then return false end
    local pos,arr = 0, {}
    for st,sp in function() return string.find(input, delimiter, pos, true) end do
        table.insert(arr, string.sub(input, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(input, pos))
    return arr
end

local function white16_compare(ip)
    local tips = false;
    for key,value in ipairs(white_list_16)
    do
        if ip == value then
            tips = true
        end 
    end
    return tips;
end

local function white24_compare(ip)
    local tips = false;
    for key,value in ipairs(white_list_24)
    do
        if ip == value then
            tips = true
        end 
    end
    return tips;
end

local ip = get_client_ip();
local list = string_split(ip, ".")
local wite16Ip = list[1]..'.'..list[2]
local wite24Ip = list[1]..'.'..list[2]..'.'..list[3]
local wite16flg = false;
local wite24flg = false;
local flg = false;

if next(white_list_16) ~= nil then
    wite16flg = white16_compare(wite16Ip)
end

if next(white_list_24) ~= nil then
    wite24flg = white24_compare(wite24Ip)
end

if next(white_list) ~= nil then
    flg = ignoreWhitelist(ip)
end

if not(flg) and not(wite16flg) and not(wite24flg) then
    local template = require "resty.template".new({
        root = "/usr/local/openresty/nginx/html/templates"
    })
    template.render("403.html")
end
