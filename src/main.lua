function _init()
    gravity = 0.3
    friction = 0.85
    player_sprite = 50
    burger_sprite = 11
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
    map(0, 0, 0, 0)
    player.draw()
    burger.draw()
    hud.draw()
    flip()
end