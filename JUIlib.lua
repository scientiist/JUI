love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";JUI/?.lua")

print("Loading JUI library...")

return {
    JUIScene     = require("lib.classes.JUIScene"),
    Frame        = require("lib.classes.Frame"),
    Label        = require("lib.classes.Label"),
    Button       = require("lib.classes.Button"),


    -- Datatypes
    Vector2D     = require("lib.datatypes.Vector2D"),
    Dimension    = require("lib.datatypes.Dimension"),
    Color        = require("lib.datatypes.Color"),

    parent = function(self, parent, child)
        parent:addChild(child)
        child:setParent(parent)
    end,
}