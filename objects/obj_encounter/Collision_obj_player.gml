if !encounter {
	alarm[0] = audio_sound_length(snd_encounterTest) * room_speed;
	encounter = true;
	global.enemyA_ID = 0;
	global.enemyB_ID = 0;
	global.enemyC_ID = 0;
	global.enemyD_ID = 0;
	global.enemyE_ID = 0;
}

else {
	
}