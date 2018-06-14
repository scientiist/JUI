love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";JUI/?.lua")

print("Loading JUI library...")

return {
    JUIScene     = require("lib.classes.JUIScene"),
    Frame        = require("lib.classes.Frame"),
    Label        = require("lib.classes.Label"),
    Button       = require("lib.classes.Button"),
    Slider       = require("lib.classes.Slider"),

    -- Datatypes
    Vector2D     = require("lib.datatypes.Vector2D"),
    Dimension    = require("lib.datatypes.Dimension"),
    Color        = require("lib.datatypes.Color"),

    Utils        = require("lib.utils.JUtils"),
    
    TextXAlign = {
        LEFT = "left",
        RIGHT = "right",
        CENTER = "center",
    },

    TextYAlign = {
        TOP = "top",
        CENTER = "center",
        BOTTOM = "bottom",
    },

    Orientation = {
        VERTICAL = "vertical",
        HORIZONTAL = "horizontal",
    },

    parent = function(self, parent, child)
        parent:addChild(child)
        child:setParent(parent)
    end,

    unparent = function(self, parent, child)
        parent:removeChild(child.name)
        child:setParent(nil)
    end,

    version = "0.1pre",
}