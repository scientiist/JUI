local Dimension = {}

setmetatable(Dimension,{
    __index = Dimension,
    __add = function(a,b) return Dimension:new(a.x+b.x,a.y+b.y) end,
    __tostring = function(a) return "("..a.x..','..a.y..")" end
})

function Dimension:new(xScale, yScale, xPixel, yPixel)
    local newDim = {
        x = {
            scale = xScale or 0,
            pixel = xPixel or 0
        },
        y = {
            scale = yScale or 0,
            pixel = yPixel or 0
        }
    }

    return setmetatable(newDim, getmetatable(self))
end 

return Dimension