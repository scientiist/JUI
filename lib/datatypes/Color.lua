local Color = {}

setmetatable(Color,{
    __index = Color,
    __add = function(a,b) return Color:new(a.x+b.x,a.y+b.y) end,
    __tostring = function(a) return "("..a.x..','..a.y..")" end
})

function Color:new(red, green, blue)
    return setmetatable({
        r = red or 0,
        g = green or 0,
        b = blue or 0
    }, getmetatable(self))
end

function Color:fromRGB()

end

function Color:fromHex()

end

function Color:out()
    return self.r, self.g, self.b
end

return Color