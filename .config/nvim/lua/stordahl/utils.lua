local utils = {}

function utils.merge(a, b)
    if type(a) == 'table' and type(b) == 'table' then
        for k,v in pairs(b) do if type(v)=='table' and type(a[k] or false)=='table' then _utils.merge(a[k],v) else a[k]=v end end
    end
    return a
end

return utils
