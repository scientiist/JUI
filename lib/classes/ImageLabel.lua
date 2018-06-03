local UIRect = require("classes/UIRect")

local ImageLabel = UIRect:subclass("ImageLabel")

function ImageLabel:init()
    self.image = nil
end

function ImageLabel:getImage()
    return self.image
end

function ImageLabel:setImage(image)
    self.image = image
end

function ImageLabel:render()
    self:super:render()

    -- TODO: render image
end

return ImageLabel
