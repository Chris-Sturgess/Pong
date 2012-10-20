module(..., package.seeall);

function move(puck)
	puck.x = puck.x + puck.speed
	
	if puck.x >= 980 and puck.speed == 5 then 
		puck.speed = -5
		return 1
	elseif puck.x <= 0 and puck.speed == -5 then 
		puck.speed = 5
		return -1
	else 
		return 0 
	end
end

function draw(puck)
	puck.x = puck.x + puck.speed
	love.graphics.drawq(puck.img, puck.bQuad, puck.x, puck.y, 0, .15, .15)
end	
	
function init()
	startSpeed = 5
	startX = 500
	startY = 200
	startWidth = 10
	startHeight = 100
	return {x = startX, y = startY, width = startWidth, height = startHeight, speed = startSpeed, img = love.graphics.newImage("Images/Ball.png"), bQuad = love.graphics.newQuad(0, 0, 100, 100, 100, 100)}
end