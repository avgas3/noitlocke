ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/noitlocke/files/actions.lua" ) -- Basically dofile("mods/example/files/actions.lua") will appear at the end of gun_actions.lua

function OnPausePreUpdate()
    removed = {}
    dofile("data/scripts/gun/gun_actions.lua")
    for i,a in ipairs(actions) do
       if HasFlagPersistent("REMOVED_noitlocke_" .. string.lower(a.id)) then
          table.insert(removed, GameTextGet(a.name))
       end
    end

    
    
    gui = gui or GuiCreate();
    GuiStartFrame(gui);
    GuiZSet(gui, 100)
    GuiText(gui, 10,5, "Removed Spells:")
    GuiBeginScrollContainer(gui, 1,2,20,100,250)
    GuiLayoutBeginVertical(gui,0,0)
    GuiZSet(gui, 100)
    for i,spell in ipairs(removed) do
        GuiText(gui, 1,0, spell)
    end
    GuiLayoutEnd(gui)
    GuiEndScrollContainer(gui)
    if GuiButton( gui, 2, 80,280,"[Reset?]" ) then
		dofile("data/scripts/gun/gun_actions.lua")
		for i,a in ipairs(actions) do
			AddFlagPersistent("noitlocke_" .. string.lower(a.id))
			RemoveFlagPersistent("REMOVED_noitlocke_" .. string.lower(a.id))
		end	
		GamePrint("Noitlocke Reset, all spells are now available.")
    end
end


