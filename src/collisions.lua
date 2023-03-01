function collide_map(object, direction, flag)
    local x = object.x
    local y = object.y
    local w = object.width
    local h = object.height

    x1, y1, x2, y2 = calculate_coords(x, y, h, w, direction)

    if fget(mget(x1, y1), flag)
    or fget(mget(x1, y2), flag)
    or fget(mget(x2, y1), flag)
    or fget(mget(x2, y2), flag) then
        return true
    else 
        return false
    end
end

function calculate_coords(x, y, h, w, direction)
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

    return x1, y1, x2, y2
end

function abs_box(s)
    local box = {}

    box.x1 = s.box.x1 + s.x
    box.y1 = s.box.y1 + s.y
    box.x2 = s.box.x2 + s.x
    box.y2 = s.box.y2 + s.y

    return box
end

function collide(a,b)
    if a.is_dummy or b.is_dummy then
        return
    end

    local box_a = abs_box(a)
    local box_b = abs_box(b)

    if box_a.x1 > box_b.x2 or
        box_a.y1 > box_b.y2 or
        box_b.x1 > box_a.x2 or
        box_b.y1 > box_a.y2 then
        return false
    end

    return true
end