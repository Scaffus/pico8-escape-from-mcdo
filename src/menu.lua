function text_init()
	text = {}
	text.active = true
	text.str = {}
	text.str = {
		"par une journee de printemps,",
		"sweety a ete livree par erreur",
		"chez un fastfood pour devenir",
		"une frite... frite alors!!!"
	}
end

function menu_init()
	text_init()
end

function menu_update()
	if (btnp(5)) then
        game_init()
    end
end

function menu_draw()
    cls(8)
	map(48, 18, 0, 0, 32, 32)
	draw_text("mangez toutes les frites", 40, true, text_color, true, background_color, true, border_color)
	draw_text("et tuez les burgers", 48, true, text_color, true, background_color, true, border_color)
	draw_text("pour sauver sweety", 56, true, text_color, true, background_color, true, border_color)
	draw_text(icons.croix .. " pour commencer ", 70, true, text_color, true, background_color, true, border_color)
 end