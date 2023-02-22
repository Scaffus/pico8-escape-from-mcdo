function _init()
    gravity = 0.3
    friction = 0.85
    player = Player(8, 8)
    burger = Burger()
end

function _update60()
    player.update()
    burger.update()
end

function _draw()
    cls()
    map(0, 0, 0, 0, 16, 16)
    player.draw()
    burger.draw()
    flip()
end
