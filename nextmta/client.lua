--
--                                          by 0xWraith(Dmitry Dzhuha)
--



local sWidth, sHeight   = guiGetScreenSize()

function randomColor()
    return tocolor(math.random(0, 255), math.random(0, 255), math.random(0, 255), 255)
end

local leftRandomSpeed = math.random(3.0, 6.0)
local rightRandomSpeed = math.random(3.0, 6.0)

local leftDVDMovementSpeedX = leftRandomSpeed
local leftDVDMovementSpeedY = leftRandomSpeed

local rightDVDMovementSpeedX = rightRandomSpeed
local rightDVDMovementSpeedY = rightRandomSpeed


local leftDVDColor      = randomColor()
local leftDVDPosX       = math.random(150, sWidth/2-150)
local leftDVDPosY       = math.random(75, sHeight - 75)

local rightDVDColor     = randomColor()
local rightDVDPosX       = math.random(sWidth/2+150, sWidth-150)
local rightDVDPosY       = math.random(75, sHeight - 75)

function drawStuff()

    dxDrawRectangle(0.0, 0.0, sWidth/2.0, sHeight, tocolor(39, 39, 39, 255))
    dxDrawRectangle(sWidth/2.0, 0.0, sWidth/2.0, sHeight, tocolor(82, 82, 82, 255))

    -- 
    -- 
    -- 

    leftDVDPosX = leftDVDPosX + leftDVDMovementSpeedX
    leftDVDPosY = leftDVDPosY + leftDVDMovementSpeedY

	if leftDVDPosX + 150.0 > sWidth/2.0 then
		leftDVDPosX = sWidth/2.0 - 150.0
		leftDVDMovementSpeedX = -leftDVDMovementSpeedX
        leftDVDColor = randomColor()
        
	elseif leftDVDPosX < 0 then
		leftDVDPosX = 0
		leftDVDMovementSpeedX = -leftDVDMovementSpeedX
		leftDVDColor = randomColor()
	end
    
    -- 
    
	if leftDVDPosY + 75.0 > sHeight then
		leftDVDPosY = sHeight - 75.0
		leftDVDMovementSpeedY = -leftDVDMovementSpeedY
		leftDVDColor = randomColor()
	elseif leftDVDPosY < 0 then
		leftDVDPosY = 0
		leftDVDMovementSpeedY = -leftDVDMovementSpeedY
		leftDVDColor = randomColor()
	end
	
    dxDrawImage(leftDVDPosX, leftDVDPosY, 150.0, 75.0, 'dvdIMG.png', 0, 0, 0, leftDVDColor)
    
    -- 
    -- 
    -- 

    rightDVDPosX = rightDVDPosX + rightDVDMovementSpeedX
    rightDVDPosY = rightDVDPosY + rightDVDMovementSpeedY

    if rightDVDPosX + 150.0 > sWidth then
		rightDVDPosX = sWidth - 150.0
		rightDVDMovementSpeedX = -rightDVDMovementSpeedX
        rightDVDColor = randomColor()
        
	elseif rightDVDPosX < sWidth/2.0 then
		rightDVDPosX = sWidth/2.0
		rightDVDMovementSpeedX = -rightDVDMovementSpeedX
		rightDVDColor = randomColor()
	end
    
    -- 

	if rightDVDPosY + 75.0 > sHeight then
		rightDVDPosY = sHeight - 75.0
		rightDVDMovementSpeedY = -rightDVDMovementSpeedY
		rightDVDColor = randomColor()
	elseif rightDVDPosY < 0 then
		rightDVDPosY = 0
		rightDVDMovementSpeedY = -rightDVDMovementSpeedY
		rightDVDColor = randomColor()
	end

    dxDrawImage(rightDVDPosX, rightDVDPosY, 150, 75, "dvdIMG.png", 0, 0, 0, rightDVDColor)

end

addEventHandler("onClientRender", root, drawStuff)

--           _
--       .__(.)< (MEOW)
--        \___)   
-- ~~~~~~~~~~~~~~~~~~