function _init()
    gravity = 0.3
    friction = 0.85
    sprites = {
        player = {
            default = 1
        },
        burger = {
            default = 2
        }
    }
    player_sprite = 1
    burger_sprite = 11
    player_current_level = 0
    
    player = Player(8, 56)
    burger = Burger()
    hud = Hud(player)
end

function _update60()
    player.update()
    burger.update()
    hud.update()
end

function _draw()
    cls()
    camera(player.x - 64, player_current_level * 16 - 16)
    map(0, 0, 0, 0)
    player.draw()
    burger.draw()
    camera()
    hud.draw()
    flip()
end