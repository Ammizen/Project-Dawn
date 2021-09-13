///@desc Battle End Conditions
#region Checks (Error Prevention & Music)
//Check if we need to move to the next character.
if (actionStack > 10) {
	playerSelecting++;
	actionStack = 0;
}

//Check if we have finished the last character's actions.
if (playerSelecting > 3) {
	askForConfirmation = true;
}

//Check if we're finished with the turnOrder queue.
if (ds_queue_empty(turnOrder) && !roundStart) {
	roundStart = true;
	ds_queue_destroy(turnOrder);
}

if ((!audio_is_playing(snd_battleIntro)) && (!audio_is_playing(snd_main_loop_1))) audio_play_sound(snd_main_loop_1, 1, true);
#endregion
#region Battle End Conditions
if (enemyStats[battleActorID.e1][stats.HP] <= 0 &&
	enemyStats[battleActorID.e2][stats.HP] <= 0 &&
	enemyStats[battleActorID.e3][stats.HP] <= 0 &&
	enemyStats[battleActorID.e4][stats.HP] <= 0 &&
	enemyStats[battleActorID.e5][stats.HP] <= 0) 
{
	battleFinished = true;
}

else if (global.playerStats[battleActorID.p1][stats.HP] <= 0 &&
	global.playerStats[battleActorID.p2][stats.HP] <= 0 &&
	global.playerStats[battleActorID.p3][stats.HP] <= 0 &&
	global.playerStats[battleActorID.p4][stats.HP] <= 0)	
{
	gameover = true;
}
#endregion