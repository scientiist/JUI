local DataType = require("lib.datatypes.DataType")


local Dimension = DataType:subclass("Dimension")

function Dimension.__add(dimA, dimB)
    return Dimension:new(
        dimA.x.scale + dimB.x.scale,
        dimA.y.scale + dimB.y.scale,
        dimA.x.pixel + dimB.x.pixel,
        dimA.y.pixel + dimA.y.pixel
    )
end

function Dimension:init(xScale, yScale, xPixel, yPixel)
    self.super:init()

    self.x = {}
    self.y = {}

    self.x.scale = xScale
    self.y.scale = yScale

    self.x.pixel = (xPixel or 0)
    self.y.pixel = (yPixel or 0)
end

function Dimension:getScaleXY()
    return self.x.scale, self.y.scale
end

function Dimension:getPixelXY()
    return self.x.pixel, self.y.pixel
end

function Dimension:getComponents()
    return self:getScaleXY(), self:getPixelXY()
end

return Dimension