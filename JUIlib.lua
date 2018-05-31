return {
    UIContainer  = require("lib.classes.UIContainer"),
    Frame        = require("lib.classes.Frame"),
    TextBox      = require("lib.classes.TextBox"),

    -- Datatypes
    Vector2D     = require("lib.datatypes.Vector2D"),
    Dimension    = require("lib.datatypes.Dimension"),
    RGBColor     = require("lib.datatypes.RGBColor"),

    parent = function(parent, child)
        parent:addChild(child)
        child:setParent(parent)
    end,
}