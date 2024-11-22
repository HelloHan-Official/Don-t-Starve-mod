local assets = {
    Asset("ANIM", "anim/paper_plane.zip"), 
    Asset("ANIM", "anim/swap_paper_plane.zip"),
    Asset("ATLAS", "images/inventoryimages/paper_plane.xml"),
    Asset("IMAGE", "images/inventoryimages/paper_plane.tex"), 
    -- 中文语音
    Asset("SOUNDPACKAGE", "sound/fire.fev"), 
    Asset("SOUND", "sound/fire.fsb"),         
}

local prefabs = {}

local function OnFinished(inst)
    inst.AnimState:PlayAnimation("used")
    inst.persists = false
    inst:ListenForEvent("animover", inst.Remove)
end

local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_paper_plane", "swap_paper_plane")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function OnPutInInventory(inst)
    inst.AnimState:PlayAnimation("idle")
    inst.components.projectile:Stop()
    inst.Physics:Stop()
end

local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function OnThrown(inst, owner, target)
    if target ~= owner then
        if owner.SoundEmitter then
            --播放回旋镖声音
        -- inst.SoundEmitter:PlaySound("dontstarve/wilson/boomerang_throw")        
        end
        --播放旋转动画（这里为什么不让在空中旋转？话说飞机不是平直的扔出去吗？） 注意！如果目标在屏幕的左边的话飞机会是屁股对着飞去 ┐(´∇｀)┌
        -- inst.AnimState:PlayAnimation("spin_loop", true)
    end
    
    if not inst.components.talker then
        inst:AddComponent("talker")  
    end

    if TUNING.LANGUAGE == "English" then
        owner.components.talker:Say("Paper airplane launch！")
    elseif TUNING.LANGUAGE == "Chinese" then
        owner.components.talker:Say("纸飞机发射！")
        
        if TUNING.SHERRY_SOUND == "sherry_cn_sound" and inst.SoundEmitter then
            owner.SoundEmitter:PlaySound("fire/fire_cn/fire")
        end
    end
end

local function OnHit(inst, owner, target)
    inst:Remove()

    local half_durability = math.ceil(inst.components.finiteuses:GetUses())

    local new_plane = SpawnPrefab("paper_plane")
    if new_plane then
        new_plane.components.finiteuses:SetUses(half_durability)
        new_plane.Transform:SetPosition(target.Transform:GetWorldPosition())
    end

    local impactfx = SpawnPrefab("impact")
    if impactfx then
        local follower = impactfx.entity:AddFollower()
        follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0)
        impactfx:FacePoint(inst.Transform:GetWorldPosition())
    end
end

local function fn(Sim)
    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)
    if SaveGameIndex:IsModePorkland() or SaveGameIndex:IsModeShipwrecked() then
        MakeInventoryFloatable(inst, "idle_water", "idle")
    end

    MakeSmallBurnable(inst)
    MakeSmallPropagator(inst)
    
    inst.AnimState:SetBank("paper_plane")
    inst.AnimState:SetBuild("paper_plane")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("projectile")
    inst:AddTag("thrown")

    inst:AddComponent("weapon")
    inst.components.weapon.projectilelaunchsymbol = "swap_object"
    inst.components.weapon:SetDamage(25)
    inst.components.weapon:SetRange(TUNING.BOOMERANG_DISTANCE, TUNING.BOOMERANG_DISTANCE + 2)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(4)
    inst.components.finiteuses:SetUses(4)
    inst.components.finiteuses:SetOnFinished(OnFinished)

    inst:AddComponent("inspectable")

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(10)
    inst.components.projectile:SetOnThrownFn(OnThrown)
    inst.components.projectile:SetOnHitFn(OnHit)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    inst.components.inventoryitem.atlasname = "images/inventoryimages/paper_plane.xml"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)

    return inst
end

return Prefab("common/inventory/paper_plane", fn, assets)
