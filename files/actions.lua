for i,a in ipairs(actions) do
	
	a['spawn_requires_flag'] = "noitlocke_" .. string.lower(a.id)
end
