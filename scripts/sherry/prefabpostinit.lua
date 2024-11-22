local function AddManaComponent(inst)
    inst:AddComponent("mana")
    if TUNING.MANA == "100" then
        inst.components.mana:Init(100, 100)
    elseif TUNING.MANA == "200" then
        inst.components.mana:Init(100, 200)
    elseif TUNING.MANA == "300" then
        inst.components.mana:Init(100, 300)
    end
end
AddPrefabPostInit("sherry", AddManaComponent)

