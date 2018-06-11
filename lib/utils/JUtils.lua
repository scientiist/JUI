local function round(number, decimalPlaces)
    decimalPlaces = decimalPlaces or 0
    local placer = 10^(-decimalPlaces)
    return (math.floor(number/placer + .5))*placer
end

local function multiple(number, m)
    return round(number/m)*m
end

local function clamp(number, min, max)
    number = (number > min) and number or min
    number = (number < max) and number or max
    return number
end


return {
    NearestMultiple = multiple,
    RoundNumber = round,
    ClampNumber = clamp,
}