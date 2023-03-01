function check_flag(flag, x, y)
    sprite = mget(flr(x) / 8, flr(y) / 8)
    return fget(sprite, flag)
end

function is_grounded(x, y, object_width)
    sprite = mget(flr(x + (object_width / 2)) / 8, flr(y+8) / 8)
    return fget(sprite, 0)
end

function round_to_multiple(num, multiple)
    return multiple * flr(num / multiple)
end

function limit_speed(num,maximum)
  return mid(-maximum,num,maximum)
end 

function check_flags(flags, celx, cely)
    sprite = mget(celx, cely)
    for _, flag in pairs(flags) do
        if not fget(sprite, flag) then 
            return false
        end
    end
    return true
end

function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end