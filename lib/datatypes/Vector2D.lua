local DataType = require("lib.datatypes.DataType")


local Vector2D = DataType:subclass("Vector2D")

function Vector2D:__add(vecA, vecB)
    return Vector2D:new(
        vecA.x + vecB.x,
        vecA.y + vecB.y
    )
end

function Vector2D:init(x, y)
    self.super:init()

    self.x = x
    self.y = y
end

function Vector2D:getX()
    return self.x
end

function Vector2D:getY()
    return self.y
end

return Vector2D