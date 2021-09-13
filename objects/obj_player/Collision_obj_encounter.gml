if global.movementEnabled {
	audio_play_sound(snd_placeholderEncounterSfx, 1, false);
	//with other instance_destroy();
	global.movementEnabled = false;
	
	encounterInst = other;
	
	alarm[0] = audio_sound_length(snd_placeholderEncounterSfx) * room_speed;
}