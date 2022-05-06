
function OnPlayerSpawned(player)
    dofile("data/scripts/gun/gun_actions.lua")
    
    for i,a in ipairs(actions) do
        if not HasFlagPersistent("noitlocke") then
            AddFlagPersistent("noitlocke_" .. string.lower(a.id))
            GamePrint(GameTextGet(a.name) .. " has been reset.")
        end
        if HasFlagPersistent("noitlocke_" .. string.lower(a.id) .. "_queued") then
            RemoveFlagPersistent("noitlocke_" .. string.lower(a.id))
            RemoveFlagPersistent("noitlocke_" .. string.lower(a.id .. "_queued"))
            GamePrint(GameTextGet(a.name) .. " has been removed from the queue.")
        end
        
    end
    AddFlagPersistent("noitlocke")
end

function OnPausePreUpdate()
    removed_spells = {}
    queued_spells = {}
    dofile("data/scripts/gun/gun_actions.lua")
    for i,a in ipairs(actions) do
       if not HasFlagPersistent("noitlocke_" .. string.lower(a.id))  then
          table.insert(removed_spells, GameTextGet(a.name))
       end
       if HasFlagPersistent("noitlocke_" .. string.lower(a.id) .. "_queued") then
          table.insert(queued_spells, GameTextGet(a.name))
       end
    end


    gui = gui or GuiCreate();
    GuiStartFrame(gui);
    
    local z = 1
    
    -- Spells Removed Pause GUI
    GuiZSet(gui, z)
    GuiText(gui, 10,5, "Removed Spells:")
    GuiBeginScrollContainer(gui, 1,2,20,70,250)
    GuiLayoutBeginVertical(gui,0,0)
    for i,spell in ipairs(removed_spells) do
        GuiZSet(gui, z)
        GuiText(gui, 1,0, spell)
    end
    GuiLayoutEnd(gui)
    GuiEndScrollContainer(gui)


    
    if ModSettingGet("noitlocke.remove_now") == "no" then
        -- Spells Queued Pause GUI
        GuiZSet(gui, z)
        GuiText(gui, 10,5, "Removed Spells:")
        GuiBeginScrollContainer(gui, 1,82,20,70,250)
        GuiLayoutBeginVertical(gui,0,0)
        for i,spell in ipairs(queued_spells) do
            GuiZSet(gui, z)
            GuiText(gui, 1,0, spell)
        end
        GuiLayoutEnd(gui)


    end



end


ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/noitlocke/files/actions.lua" ) -- Basically dofile("mods/example/files/actions.lua") will appear at the end of gun_actions.lua
