for i,a in ipairs(actions) do
	if HasFlagPersistent(a['spawn_requires_flag']) or not a['spawn_requires_flag'] then
		a['spawn_requires_flag'] = "noitlocke_" .. string.lower(a.id)
	end
end
