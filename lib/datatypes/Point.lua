local Point = {}

local meta = {}
meta.__index = Point

function meta.__add(pointA, pointB)
    return Point:new(pointA.x + pointB.x, pointA.y + pointB.y)
end

function meta.__tostring(vec)

end

setmetatable(Point, meta)

function Point:new(x, y)

    local newObj = {}
        object.x = x or 0
        object.y = y or 0
    
    return setmetatable(newObj, getmetatable(self))
end 

return Point