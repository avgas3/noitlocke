dofile("data/scripts/gun/gun_actions.lua")
if not HasFlagPersistent("noitlocke") then
    for i,a in ipairs(actions) do
        AddFlagPersistent("noitlocke_" .. string.lower(a.id))
        RemoveFlagPersistent("REMOVED_noitlocke_" .. string.lower(a.id))
    end	
    AddFlagPersistent("noitlocke")
    GamePrint("Noitlocke Reset, all spells are now available.")
end

function OnPausePreUpdate()
    removed_spells = {}
    dofile("data/scripts/gun/gun_actions.lua")
    for i,a in ipairs(actions) do
       if HasFlagPersistent("REMOVED_noitlocke_" .. string.lower(a.id)) then
          table.insert(removed_spells, GameTextGet(a.name))
       end
    end

    removed_perks = {}
    dofile("data/scripts/perks/perk_list.lua")
    for i,p in ipairs(perk_list) do
        local flag_name = string.lower(get_perk_picked_flag_name( p.id ))
        if HasFlagPersistent("noitlocke_perk_" .. flag_name) then
            table.insert(removed_perks, GameTextGet(p.ui_name))
        end
    end
    
    
    gui = gui or GuiCreate();
    GuiStartFrame(gui);

    if ModSettingGet('noitlocke.spells_enabled') then
        -- Spells Removed Pause GUI
        GuiZSet(gui, 100)
        GuiText(gui, 10,5, "Removed Spells:")
        GuiBeginScrollContainer(gui, 1,2,20,100,250)
        GuiLayoutBeginVertical(gui,0,0)
        GuiZSet(gui, 100)
        for i,spell in ipairs(removed_spells) do
            GuiText(gui, 1,0, spell)
        end
        GuiLayoutEnd(gui)
        GuiEndScrollContainer(gui)
        if GuiButton( gui, 2, 80,280,"[Reset?]" ) then
            for i,a in ipairs(actions) do
                AddFlagPersistent("noitlocke_" .. string.lower(a.id))
                RemoveFlagPersistent("REMOVED_noitlocke_" .. string.lower(a.id))
            end	
            GamePrint("Noitlocke Reset, all spells are now available.")
        end
    end
    if ModSettingGet('noitlocke.perks_enabled') then
        -- Perks Removed Pause GUI
        GuiZSet(gui, 1)
        GuiText(gui, 160,5, "Removed Perks:")
        GuiBeginScrollContainer(gui, 1,162,20,100,250)
        GuiLayoutBeginVertical(gui,0,0)
        GuiZSet(gui, 1)
        for i,perk in ipairs(removed_perks) do
            GuiText(gui, 1,0, perk)
        end
        GuiLayoutEnd(gui)
        GuiEndScrollContainer(gui)
        if GuiButton( gui, 162, 80,280,"[Reset?]" ) then
            for i,a in ipairs(perk_list) do
                AddFlagPersistent("noitlocke_" .. string.lower(a.id))
                RemoveFlagPersistent("noitlock_perk" .. string.lower(a.id))
            end	
            GamePrint("Noitlocke Reset, all perks are now available.")
        end
    end


end


ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/noitlocke/files/actions.lua" ) -- Basically dofile("mods/example/files/actions.lua") will appear at the end of gun_actions.lua
