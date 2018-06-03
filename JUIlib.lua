love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";JUI/?.lua")

return {
    JUIScene     = require("lib.classes.JUIScene"),
    Frame        = require("lib.classes.Frame"),
    Label        = require("lib.classes.Label"),


    -- Datatypes
    Vector2D     = require("lib.datatypes.Vector2D"),
    Dimension    = require("lib.datatypes.Dimension"),
    Color        = require("lib.datatypes.Color"),
    HexColor     = require("lib.datatypes.HexColor"),
    RGBColor     = require("lib.datatypes.RGBColor"),

    parent = function(parent, child)
        parent:addChild(child)
        child:setParent(parent)
    end,
}