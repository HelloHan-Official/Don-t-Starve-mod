local function get_inventory()
    local start_inv
    if TUNING.MODE == "easy" then
        start_inv = {
            "winter_sword", "glasses", "valise", "feather_backpack",
            "strawberry_cake", "strawberry_cake", "strawberry_cake",
            "blueberry_cake", "blueberry_cake", "blueberry_cake"
        }
    elseif TUNING.MODE == "normal" then
        start_inv = {
            "broken_sword", "valise",
            "blueberry_seeds", "blueberry_seeds", "blueberry_seeds",
            "strawberry_seeds", "strawberry_seeds", "strawberry_seeds"
        }
    elseif TUNING.MODE == "hard" then
        start_inv = {"blood_sword_2", "valise"}
    end
    return start_inv
end

return {
    get_inventory = get_inventory
}