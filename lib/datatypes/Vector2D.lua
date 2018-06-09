local Vector2D = {}

local meta = {}
meta.__index = Vector2D

function meta.__add(vecA, vecB)
    return Vector2D:new(vecA.x + vecB.x, vecA.y + vecB.y)
end

function meta.__tostring(vec)
    return string.format("Vector2D: %d, %d", vec.x, vec.y)
end

setmetatable(Vector2D, meta)

function Vector2D:new(x, y)

    local object = {}
        object.x = x or 0
        object.y = y or 0
    
    return setmetatable(object, getmetatable(self))
end

return Vector2D