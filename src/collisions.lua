function collide_map(object, direction, flag)
    local x = object.x
    local y = object.y
    local w = object.width
    local h = object.height

    local x1 = 0
    local y1 = 0
    local x2 = 0
    local y2 = 0

    if direction == "left" then
        x1 = x - 1
        y1 = y
        x2 = x
        y2 = y + h - 1
    elseif direction == "right" then
        x1 = x + w
        y1 = y
        x2 = x + w + 1
        y2 = y + h - 1
    elseif direction == "up" then
        x1 = x + 1
        y1 = y - 1
        x2 = x + w - 1
        y2 = y
    elseif direction == "down" then
        x1 = x
        y1 = y + h
        x2 = x + w
        y2 = y + h
    end

    x1 /= 8
    y1 /= 8
    x2 /= 8
    y2 /= 8

    if fget(mget(x1, y1), flag)
    or fget(mget(x1, y2), flag)
    or fget(mget(x2, y1), flag)
    or fget(mget(x2, y2), flag) then
        return true
    else 
        return false
    end
end