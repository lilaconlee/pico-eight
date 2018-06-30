pico-8 cartridge // http://www.pico-8.com
version 15
__lua__
scrn = {}
p1 = {}
p2 = {}

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
	
	p1.x = 32
	p1.y = 64
	p1.dir = 1
	
	p2.x = 96
	p2.y = 64
	p2.dir = 1
	
	cls()
	
	rect(0,0,127,127,1)
end

function update_game()
	if (p1.dir == 1) then p1.y=p1.y - 1 end
	if (p1.dir == 2) then p1.x=p1.x + 1 end
	if (p1.dir == 3) then p1.y=p1.y + 1 end
	if (p1.dir == 4) then p1.x=p1.x - 1 end
	
	if (btnp(0)) then p1.dir = p1.dir - 1 end
	if (btnp(1)) then p1.dir = p1.dir + 1 end

	if (p1.dir > 4) then p1.dir = 1 end
	if (p1.dir < 1) then p1.dir = 4 end
	
	if (pget(p1.x,p1.y) != 0) then show_game_over() end

end

function draw_game()
	pset(p1.x,p1.y,12)
end

function show_game_over()
	scrn.upd = update_game_over
	scrn.drw = draw_game_over
end

function update_game_over()
	if (btnp(4)) then show_menu() end
end

function draw_game_over()
	print ("game over!",30,50,7)
end


function _update()
	scrn.upd()
end

function _draw()
	scrn.drw()
end
