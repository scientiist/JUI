local function round(number, decimalPlaces)
    local placer = 10^(-decimalPlaces)
    return (math.floor(number)/placer)*placer
end

local function clamp(number, min, max)
    number = (number > min) and number or min
    number = (number < max) and number or max
    return number
end


return {
    RoundNumber = round,
    ClampNumber = clamp,
}