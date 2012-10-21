module(..., package.seeall);

function move(puck, playerLoc, enemyLoc)
	puck.x = puck.x + puck.xSpeed
	puck.y = puck.y + puck.ySpeed
	
	if puck.y >= 480 and puck.ySpeed > 0 then 
		puck.ySpeed = puck.ySpeed * -1
	elseif puck.y <= 0 and puck.ySpeed < 0 then 
		puck.ySpeed = puck.ySpeed * -1 
	end
	
	if puck.x >= 980 and puck.speed > 0 then 
		return 1
	elseif puck.x >= 950 and puck.xSpeed > 0 then
		if puck.y + 20 >= enemyLoc and puck.y <= enemyLoc + 100 then puck.speed = puck.speed * -1 end
		puck.angle = newAngle(puck.y, enemyLoc)
		puck.speed = puck.speed + .5
		puck.xSpeed = math.sin(puck.angle) * puck.speed
		puck.ySpeed = math.cos(puck.angle) * puck.speed
	elseif puck.x <= 0 and puck.xSpeed < 0 then 
		return -1
	elseif puck.x <= 30 and puck.speed < 0 then
		if puck.y + 20 >= playerLoc and puck.y <= playerLoc + 100 then puck.speed = puck.speed * -1 end
		puck.angle = newAngle(puck.y, playerLoc)
		puck.speed = puck.speed + .5
		puck.xSpeed = math.sin(puck.angle) * puck.speed
		puck.ySpeed = math.cos(puck.angle) * puck.speed * -1
	else 
		return 0 
	end
end

function draw(puck)
	love.graphics.drawq(puck.img, puck.bQuad, puck.x, puck.y, 0, .15, .15)
end	
	
function init()
	startSpeed = 10
	startAngle = math.cos(0)
	startX = 500
	startY = 200
	startWidth = 10
	startHeight = 100
	return {x = startX, y = startY, width = startWidth, height = startHeight, speed = startSpeed, img = love.graphics.newImage("Images/Ball.png"), bQuad = love.graphics.newQuad(0, 0, 100, 100, 100, 100), angle = startAngle, xSpeed = 5, ySpeed = 5}
end

function newAngle(puckLoc, paddleLoc)
	angleDir = puckLoc - (paddleLoc - 20)
	angleDir = angleDir / 120
	return angleDir * math.pi
end