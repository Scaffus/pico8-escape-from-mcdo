function Hud(player)
    local hud = {}
    hud.player = player
    hud.game_over_text = "game over!"
    hud.score_text = "score: "

    hud.text_color = 7

    hud.positions = {
        hearts = {
            x = 1,
            y = 128 - 8
        },
        score = {
            x = 1,
            y = 1
        }
    }

    hud.update = function()
        hud.hearts = player.hp
    end

    hud.draw = function()
        if not player.is_dead then
            print(hud.score_text .. player.score, 2, 2, hud.text_color)
            for i=0, hud.hearts-1 do
                spr(sprites.heart,  (hud.positions.hearts.x + 8) * i, hud.positions.hearts.y)
            end
        else
            hud.draw_text(hud.game_over_text, 56, true, colors.white, true, colors.black, true, colors.white)
            hud.draw_text(hud.score_text .. player.score, 72, true, colors.white, true, colors.black, true, colors.white)
        end
    end

    hud.draw_text = function(text, y, x_centered, text_color, background, background_color, border, border_color) 
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

    return hud
end