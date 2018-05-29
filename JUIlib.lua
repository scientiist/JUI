return {
    UIContainer  = require("classes/UIContainer"),
    Frame        = require("classes/Frame"),
    TextBox      = require("classes/TextBox"),

    -- Datatypes
    Vector2D     = require("classes/Vector2D"),
    Dimension    = require("classes/Dimension"),
    RGBColor     = require("classes/RGBColor"),

    parent = function(parent, child)
        parent:addChild(child)
        child:setParent(parent)
    end,
}