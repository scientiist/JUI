local Color = {}

setmetatable(Color,{
    __index = Color,
    __add = function(a,b) return Color:new() end,
    __tostring = function(a) return "("..a.x..','..a.y..")" end
})

function Color:new(red, green, blue, alpha)
    return setmetatable({
        r = red or 0,
        g = green or 0,
        b = blue or 0,
        a = alpha or 1,
    }, getmetatable(self))
end

function Color:fromRGB(red, green, blue, alpha)
    return Color:new(red/255, green/255, blue/255, (alpha or 255)/255)
end

function Color:fromHSL(h, s, l, alpha)
    if s == 0 then return l,l,l end
    h, s, l = h/256*6, s/255, l/255
    local c = (1-math.abs(2*l-1))*s
    local x = (1-math.abs(h%2-1))*c
    local m,r,g,b = (l-.5*c), 0,0,0
    if h < 1     then r,g,b = c,x,0
    elseif h < 2 then r,g,b = x,c,0
    elseif h < 3 then r,g,b = 0,c,x
    elseif h < 4 then r,g,b = 0,x,c
    elseif h < 5 then r,g,b = x,0,c
    else              r,g,b = c,0,x
    end
    local r, g, b = r+m, g+m, b+m
    return Color:new(r, g, b, (alpha or 255)/255)
end

function Color:fromHex(hex, alpha)
    local hex = hex:gsub("#","")

    local r, g, b
    if hex:len() == 3 then
      r, g, b = (tonumber("0x"..hex:sub(1,1))*17)/255, (tonumber("0x"..hex:sub(2,2))*17)/255, (tonumber("0x"..hex:sub(3,3))*17)/255
    else
      r, g, b = tonumber("0x"..hex:sub(1,2))/255, tonumber("0x"..hex:sub(3,4))/255, tonumber("0x"..hex:sub(5,6))/255
    end

    return Color:new(r, g, b, (alpha or 255)/255)
end

function Color:out()
    return self.r, self.g, self.b, self.a
end

return Color