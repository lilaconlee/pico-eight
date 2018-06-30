pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
scrn = {}

function _init()
	show_menu()
end

function show_menu()
	scrn.upd = update_menu
	scrn.drw = draw_menu
	cls()
end

function update_menu()
	if (btnp(4)) then run_game() end
end

function draw_menu()
	print ("press z to start",30,50,7)
end

function run_game()
	scrn.upd = update_game
	scrn.drw = draw_game
	
	-- initalize game stuff
end

function update_game()
	-- update game state
end

function draw_game()
	-- draw game stuff
end

function show_game_over()
	scrn.upd = update_game_over
	scrn.drw = draw_game_over
end

function update_game_over()
	if (btnp(4)) then show_menu() end
end

function draw_game_over()
	print("game over!",30,50,7)
end

function _update()
	scrn.upd()
end

function _draw()
	scrn.drw()
end
