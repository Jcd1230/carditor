local l = love
local lg = l.graphics
local lm = l.math

function love.load()


end

local view_transform = lm.newTransform()
local root_pts = {}

function love.draw()
	lg.clear(255,255,255)
	lg.replaceTransform(view_transform)
	lg.setColor(0,0,0)
	lg.polygon("fill", 50,50, 100,50, 75,75)
	for i,v in ipairs(root_pts) do
		lg.setColor(255,0,0,0.5)
		lg.drawPoint(v.x, v.y)
	end
	local _y = 0
	for k,v in pairs(buttondown) do
		lg.print(0,y,k.."="..v)
		y=y+30
	end
end

local camera_mode = ""
local keydown = {}
local buttondown = {}
function love.keypressed( key, scancode, isrepeat )
	keydown[scancode] = true
end

function love.keyreleased( key, scancode )
	keydown[scancode] = false
end

function love.mousemoved( x, y, dx, dy, istouch )

end

function love.mousepressed( x, y, button, istouch )
	buttondown[button] = true
end

function love.mousereleased( x, y, button, istouch )
	buttondown[button] = false
end

function love.wheelmoved( x, y )
	view_transform:scale(1 + (y/10))
end
