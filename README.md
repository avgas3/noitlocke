# Noitlocke
## A Nuzzlocke inspired mod that removes spells you cast from the spawn pool.

Version  0.1:

- Loading this mod will temporarily set/overwrite the `spawn_requires_flag` parameter for each spell in the game to `noitlocke_spell_id` where `spell_id` is, of course, each spell's ID. 

- Before starting your first run with Noitlocke loaded, be sure to hit "Initialize Noitlocke" in the mod settings. This will create the required "flags" to unlock all the spells. This will not affect your vanilla unlock progress.

- Whenever you cast a spell, it's corresponding `noitlocke_spell_id` flag is removed, preventing it from spawning on wands/shops/etc. in the future.

- The player's starting wands, as well as the "prebuilt" wands in the first level are unaffected, although casting the spells will prevent them from spawning later in the run.

- Spells stay removed from the spawn pool until hitting "Initialize Noitlocke" in the settings again. 

TODO:

- Automatically "initialize noitlocke" when starting a run with the mod enabled for the first time.
- GUI element to indicate how many (and which?) spells have been removed already.
- Add Noitlocke gameplay to perks, options to toggle spells and perks individually.
- Log to the bottom left console.