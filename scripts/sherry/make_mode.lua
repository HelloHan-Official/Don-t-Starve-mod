if TUNING.MODE == "easy" then--道具的制作配方
    modimport("scripts/sherry/recipes_easy.lua")
elseif TUNING.MODE == "normal" then
    modimport("scripts/sherry/recipes.lua")
elseif TUNING.MODE == "hard" then
    modimport("scripts/sherry/recipes_hard.lua")
end
