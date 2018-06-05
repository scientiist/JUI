local Vector2D = {}

setmetatable(Vector2D,{
    __index = Vector2D,
    __add = function(a,b) return Vector2D:new(a.x+b.x,a.y+b.y) end,
    __tostring = function(a) return "("..a.x..','..a.y..")" end
})

function Vector2D:new(x,y)
    return setmetatable({x=x or 0, y=y or 0}, getmetatable(self))
end 

return Vector2D