local DataType = require("DataType")


local Dimension = DataType:subclass("Dimension")

function Dimension:init(xScale, yScale, xPixel, yPixel)
    self.x = {}
    self.y = {}

    self.x.scale = xScale
    self.y.scale = yScale

    self.x.pixel = xPixel
    self.y.pixel = yPixel


end

function Dimension:getScaleSizeComponents()
    return self.x.scale, self.y.scale
end

function Dimension:getPixelSizeComponents()
    return self.x.pixel, self.y.pixel
end