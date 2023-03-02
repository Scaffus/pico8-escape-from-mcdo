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

function draw_text(text, y, x_centered, text_color, background, background_color, border, border_color) 
        local length = #text * char_width
        local start_x, start_y = 0, y

        if border then
            start_x = 2
        elseif background then
            start_x = 1
        end 
        
        if x_centered then
            start_x += 64 - length / 2
        end

        local end_x, end_y = start_x + length - char_width / 2, y + char_height - 1 

        if border then
            rectfill(start_x - 2, start_y - 2, end_x + 2, end_y + 2, border_color)
        end

        if background then
            rectfill(start_x - 1, start_y - 1, end_x + 1, end_y + 1, background_color)
        end

        print(text, start_x, start_y, text_color)
    end