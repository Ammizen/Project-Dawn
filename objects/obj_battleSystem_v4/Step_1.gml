/// @description State checking & Inputs
#region Key presses
keyUp = keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(vk_down);
keyEnter = keyboard_check_pressed(vk_enter);
keyEscape = keyboard_check_pressed(vk_escape);

//Check if there's a gamepad and add the values together.
if gamepad_is_connected(0) {
	padUpDP = gamepad_button_check_pressed(0, gp_padu);
	padDownDP = gamepad_button_check_pressed(0, gp_padd);
	padConfirm = gamepad_button_check_pressed(0, gp_face1);
	padBack = gamepad_button_check_pressed(0, gp_face2);
	lsAxisUp = false;
	lsAxisDown = false;
	
	if (gamepad_axis_value(0, gp_axislv) > 0.5) lsAxisUp = true;
	else if (gamepad_axis_value(0, gp_axislv) < -0.5) lsAxisDown = true;
		
	inputUp = keyUp || padUpDP || lsAxisUp;
	inputDown = keyDown || padDownDP || lsAxisDown;
	inputConfirm = keyEnter || padConfirm;
	inputBack = keyEscape || padBack;
}

//Otherwise, pass the keypresses as input.
else {
	inputUp = keyUp;
	inputDown = keyDown;
	inputConfirm = keyEnter;
	inputBack = keyEscape;
}
#endregion
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
#region Action Count
var highestSpeed_enemy = enemyStats[battleActorID.e1][stats.spd];
if (highestSpeed_enemy < enemyStats[battleActorID.e2][stats.spd]) highestSpeed_enemy = enemyStats[battleActorID.e2][stats.spd];
if (highestSpeed_enemy < enemyStats[battleActorID.e3][stats.spd]) highestSpeed_enemy = enemyStats[battleActorID.e3][stats.spd];
if (highestSpeed_enemy < enemyStats[battleActorID.e4][stats.spd]) highestSpeed_enemy = enemyStats[battleActorID.e4][stats.spd];
if (highestSpeed_enemy < enemyStats[battleActorID.e5][stats.spd]) highestSpeed_enemy = enemyStats[battleActorID.e5][stats.spd];

var highestSpeed_player = playerStats[battleActorID.p1][stats.spd];
if (highestSpeed_player < playerStats[battleActorID.p2][stats.spd]) highestSpeed_player = playerStats[battleActorID.p2][stats.spd];
if (highestSpeed_player < playerStats[battleActorID.p3][stats.spd]) highestSpeed_player = playerStats[battleActorID.p3][stats.spd];
if (highestSpeed_player < playerStats[battleActorID.p4][stats.spd]) highestSpeed_player = playerStats[battleActorID.p4][stats.spd];

if (highestSpeed_player >= highestSpeed_enemy) {
	var highestSpeed = highestSpeed_player;
}
else if (highestSpeed_player <= highestSpeed_enemy) {
	var highestSpeed = highestSpeed_enemy;
}

actionCount[battleActorID.p1] = 0;
actionCount[battleActorID.p2] = 0;
actionCount[battleActorID.p3] = 0;
actionCount[battleActorID.p4] = 0;
actionCount[battleActorID.e1] = 0;
actionCount[battleActorID.e2] = 0;
actionCount[battleActorID.e3] = 0;
actionCount[battleActorID.e4] = 0;
actionCount[battleActorID.e5] = 0;
#endregion