-- attention, this file may not be up to date!

local field = {
2,    4,     8,    16,
32,   64,  128,   256,
512,  1024,  2048,   4096,
0,       0,     0,   0
}

local valueToColor = { 
    [2] = 0xEEE4DA, 
    [4] = 0xEDE0C8,
    [8] = 0xF2B179,
    [16] = 0xf59563,
    [32] = 0xf67c5f,
    [64] = 0xf65e3b,
    [128] = 0xedcf72,
    [256] = 0xedcc61,
    [512] = 0xedc850,
    [1024] = 0xedc53f,
    [2048] = 0xedc22e,
    [4096] = 0x3c3a32
}


function on.paint(gc)
    drawField(gc)
end

function drawField(gc)
    gc:setColorRGB(0xBBADA0)
    gc:fillRect(0,0,200,200)
    
    for i = 1, 16 do
    
        if field[i] == 0 then
            gc:setColorRGB(0xC9BDB3)
            gc:fillRect((math.floor((i-1) % 4))*50, (math.floor((i-1) / 4))*50, 45,45)
        else
            drawTile(gc, i, field[i], getTileColor(field[i]))
        end
        
        
    end
end

function drawTile(gc, i, val, color)
    gc:setColorRGB(color)
    gc:fillRect((math.floor((i-1) % 4))*50, (math.floor((i-1) / 4))*50, 45,45)
    gc:setColorRGB(getTileTextColor(val))
    
   -- gc:drawString(val, (math.floor((i-1) % 4))*50+((45-(tostring(val):len()*10))/3), (math.floor((i-1) / 4))*50+(45/2), "middle")
    drawTextMiddle(gc, val, (math.floor((i-1) % 4))*50, (math.floor((i-1) / 4))*50)
end

function getTileColor(val)
    if val >= 4096 then
        return valueToColor[4096]
    else
        return valueToColor[val]
    end
end

function getTileTextColor(val)
    if val >= 2 and val <= 4 then
        return 0x000000
    else
        return 0xFFFFFF
    end
end

function drawTextMiddle(gc, text, x, y)
    local height = gc:getStringHeight(text)
    local width = gc:getStringWidth(text)
    gc:drawString(text, x + 45/2-width/2, y + 45/2 - height/2)
end