function CreateFries()
    fries = {}
    for x = 0, 127 do
        for y = 0, 12 do
            if check_flags(flags.fries.flags, x, y) then
                fries[#fries+1] = Fries(x * 8, y * 8)
                mset(x, y, sprites.background)
            end
        end
    end
    return fries
end


function Fries(x_, y_)
    local fries = {}
    fries.x = x_
    fries.y = y_
    fries.y_offset = 0
    fries.width = 8
    fries.height = 8

    fries.box = {
        x1 = 1,
        y1 = 1,
        x2 = 7,
        y2 = 7,
    }

    fries.dir = "-"
    fries.anim_timer_bounce = 0
    fries.anim_max_bounce = 12

    fries.update = function()
        fries.anim_timer_bounce = fries.anim_timer_bounce + 1
        if fries.anim_timer_bounce >= fries.anim_max_bounce then
            if fries.dir == "+" then
                fries.y_offset += 1
                fries.dir = "-"
            else
                fries.y_offset -= 1
                fries.dir = "+"
            end
            fries.anim_timer_bounce = 0
        end
    end

    fries.draw = function()
        spr(sprites.fries.default, fries.x, fries.y + fries.y_offset)
    end

    return fries
end