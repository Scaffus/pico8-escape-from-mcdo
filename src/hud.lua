function Hud(player)
    local hud = {}
    hud.player = player
    hud.game_over_text = "game over!"
    hud.score_text = "score: "
    hud.win_text = {"la patate a echapee", "au vilain colonel ronald"}

    hud.text_color = 7

    hud.positions = {
        hearts = {
            x = 1,
            y = 120
        },
        score = {
            x = 1,
            y = 1
        },
        shield = {
            x = 120,
            y = 120
        }
    }
    
    hud.hearts = player.hp

    hud.update = function()
        hud.hearts = player.hp
    end

    hud.draw = function()
        if player.won then
            -- Win
            draw_text(hud.win_text[1], 56, true, text_color, true, background_color, true, border_color)
            draw_text(hud.win_text[2], 64, true, text_color, true, background_color, true, border_color)
            draw_text(hud.score_text .. player.score, 76, true, text_color, true, background_color, true, border_color)
        elseif player.is_dead then
            -- Game Over
            draw_text(hud.game_over_text, 56, true, text_color, true, background_color, true, border_color)
            draw_text(hud.score_text .. player.score, 72, true, text_color, true, background_color, true, border_color)
        else
            -- Game Hud
            -- Score
            print(hud.score_text .. player.score, 2, 2, hud.text_color)

            -- Hearts
            for i=0, hud.hearts-1 do
                spr(sprites.heart,  (hud.positions.hearts.x + 8) * i, hud.positions.hearts.y)
            end

            -- Shield
            if player.is_shielded then
                sprite = sprites.shield_full
            else 
                sprite = sprites.shield_empty
            end
            spr(sprite, hud.positions.shield.x, hud.positions.shield.y)
        end
    end

    return hud
end