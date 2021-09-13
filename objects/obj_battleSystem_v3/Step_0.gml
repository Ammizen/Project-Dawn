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
#region Main Battle Process
//Checking if the battle has not already been finished.
if !battleFinished {
	//Check if we're not already asking the player to confirm their selections.
	if !askForConfirmation {
		/*	
			Note for future Ammi (Written on: 07/24/21 @ 05:30): 
			Perhaps it would be better to move the "Skill" and "Item" actions to their own code files...
			This way we can loop the extra code file and reuse it. For now, I shall focus on getting the 
			rest of the system to work. Bit by bit, slowly making progress.
						
			Side note... Still can't sleep. 'tis unfortunate, however nothing I can do about it.
			In the meantime, I'll get more work done here XP
		*/
		
		#region Round Start || Selection Phase
		//Check if we are at the start of a round.
		if roundStart {
			//Check what we should be processing right now.
			switch (playerActions[playerSelecting][# actionStack, actionInfo.actionID]) {
				#region ACTION SELECTING: Selecting
				case battleActions.selecting:
					if inputUp { 
						cursorSelection--;
						audio_play_sound(snd_cursor1, 1, false);
					}
					if inputDown {
						cursorSelection++;
						audio_play_sound(snd_cursor1, 1, false);
					}
					if (cursorSelection < battleActions.attack) {
						cursorSelection = battleActions.flee;
						audio_play_sound(snd_cursor1, 1, false);
					}
					if (cursorSelection > battleActions.flee) {
						cursorSelection = battleActions.attack;
						audio_play_sound(snd_cursor1, 1, false);
					}
					if inputConfirm {
						playerActions[playerSelecting][# actionStack, actionInfo.actionID] = cursorSelection;
						audio_play_sound(snd_cursorConfirm, 1, false);
					}
					else if inputBack {
						if (actionStack > 0) actionStack--;
						else if (playerSelecting > 0) {
							playerSelecting--;
							actionStack = ds_grid_width(playerActions[playerSelecting]) - 2;
						}
						else audio_play_sound(snd_errBuzzer, 1, false);
						playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
						playerActions[playerSelecting][# actionStack, actionInfo.target] = 0;
						playerActions[playerSelecting][# actionStack, actionInfo.lookup] = 0;
					}
					break;
				#endregion
				#region ACTION SELECTING: Attack
				case battleActions.attack:
					if inputUp {
						audio_play_sound(snd_cursor1, 1, false);
						enemySelection--;
					}
					if inputDown {
						audio_play_sound(snd_cursor1, 1, false);
						enemySelection++;
					}
					if inputConfirm {
						playerActions[playerSelecting][# actionStack, actionInfo.target] = enemySelection;
						actionStack++;
						ds_grid_resize(playerActions[playerSelecting], actionStack + 1, 4);
						audio_play_sound(snd_cursorConfirm, 1, false);
					}
					else if inputBack {
						playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
					}
					
					if (enemySelection > enemyCount - 1) enemySelection = 0;
					else if (enemySelection < 0) enemySelection = enemyCount - 1;
					break;
				#endregion
				#region ACTION SELECTING: Defend {UNFINISHED}
				case battleActions.defend:
					audio_play_sound(snd_errBuzzer, 1, false);
					playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
					break;
				#endregion
				#region ACTION SELECTING: Skils {UNFINISHED}
				case battleActions.skills:
					audio_play_sound(snd_errBuzzer, 1, false);
					playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
					break;
				#endregion
				#region ACTION SELECTING: Item {UNFINISHED}
				case battleActions.item:
					audio_play_sound(snd_errBuzzer, 1, false);
					playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
					break;
				#endregion
				#region ACTION SELECTING: Finish
				case battleActions.finish:
					//Check if at least one action has been input.
					if (actionStack != 0) {
						actionStack = 0;
						playerSelecting++;
					}
					else {
						audio_play_sound(snd_errBuzzer, 1, false);
						playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
					}
					break;
				#endregion
				#region ACTION SELECTING: Flee
				case battleActions.flee:
					//if (actionStack == 0) {
					//	fleeProcessing();
					//}
					//else {
					//	audio_play_sound(snd_errBuzzer, 1, false);
					//	playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
					//}
					audio_play_sound(snd_errBuzzer, 1, false);
					playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
					break;
				#endregion
			}
		}
		#endregion
		
		#region Round Main Processing || Action Phase
		else {
			#region Setting Turn Order
			if !turnOrderSet {
				
				try {
					if ds_exists(speedGrid, ds_type_grid) ds_grid_destroy(speedGrid);
					if ds_exists(turnOrder, ds_type_queue) ds_queue_destroy(turnOrder);
				}
				catch (_exception) {
					show_debug_message(_exception.message);
					show_debug_message(_exception.longMessage);
					show_debug_message(_exception.stacktrace);
					show_debug_message(_exception.script);
					speedGrid = ds_grid_create(1, 1);
					turnOrder = ds_queue_create();
				}
				
				var tieID = 0;
				
				var actionTotal = ds_grid_width(playerActions[battleActorID.p1]) + 
					ds_grid_width(playerActions[battleActorID.p2]) + 
					ds_grid_width(playerActions[battleActorID.p3]) + 
					ds_grid_width(playerActions[battleActorID.p4]) + 
					ds_grid_width(playerActions[battleActorID.e1]) + 
					ds_grid_width(playerActions[battleActorID.e2]) + 
					ds_grid_width(playerActions[battleActorID.e3]) + 
					ds_grid_width(playerActions[battleActorID.e4]) + 
					ds_grid_width(playerActions[battleActorID.e5]);
				var p1Actions = 0;
				var p2Actions = 0;
				var p3Actions = 0;
				var p4Actions = 0;
				var e1Actions = 0;
				var e2Actions = 0;
				var e3Actions = 0
				var e4Actions = 0;
				var e5Actions = 0;
				speedGrid = ds_grid_create(actionTotal, 2);
				for (var n = 0; n <= actionTotal; n++) {
					var a = 0
					var b = a + ds_grid_width(playerActions[battleActorID.p1]);
					var c = b + ds_grid_width(playerActions[battleActorID.p3]);
					var d = c + ds_grid_width(playerActions[battleActorID.p4]);
					var e = d + ds_grid_width(playerActions[battleActorID.e1]);
					var f = e + ds_grid_width(playerActions[battleActorID.e2]);
					var g = f + ds_grid_width(playerActions[battleActorID.e3]);
					var h = g + ds_grid_width(playerActions[battleActorID.e4]);
					
					if (n < ds_grid_width(playerActions[battleActorID.p1])) {
						speedGrid[# n, 0] = global.global.playerStats[battleActorID.p1][stats.spd]/(ds_grid_width(playerActions[battleActorID.p1]) - p1Actions); 
						speedGrid[# n, 1] = battleActorID.p1;
						p1Actions++;
					}
					else if (n - a < ds_grid_width(playerActions[battleActorID.p2])) {
						speedGrid[# n, 0] = global.global.playerStats[battleActorID.p2][stats.spd]/(ds_grid_width(playerActions[battleActorID.p2]) - p2Actions);
						speedGrid[# n, 1] = battleActorID.p2;
						p2Actions++;
					}
					else if (n - b < ds_grid_width(playerActions[battleActorID.p3])) {
						speedGrid[# n, 0] = global.global.playerStats[battleActorID.p3][stats.spd]/(ds_grid_width(playerActions[battleActorID.p3]) - p3Actions);
						speedGrid[# n, 1] = battleActorID.p3;
						p3Actions++;
					}
					else if (n - c < ds_grid_width(playerActions[battleActorID.p4])) {
						speedGrid[# n, 0] = global.global.playerStats[battleActorID.p4][stats.spd]/(ds_grid_width(playerActions[battleActorID.p4]) - p4Actions);
						speedGrid[# n, 1] = battleActorID.p4;
						p4Actions++;
					}
					else if (n - d < ds_grid_width(playerActions[battleActorID.e1])) {
						speedGrid[# n, 0] = global.playerStats[battleActorID.e1][stats.spd]/(ds_grid_width(playerActions[battleActorID.e1]) - e1Actions);
						speedGrid[# n, 1] = battleActorID.e1;
						e1Actions++;
					}
					else if (n - e < ds_grid_width(playerActions[battleActorID.e2])) {
						speedGrid[# n, 0] = global.playerStats[battleActorID.e2][stats.spd]/(ds_grid_width(playerActions[battleActorID.e2]) - e2Actions);
						speedGrid[# n, 1] = battleActorID.e2;
						e2Actions++;
					}
					else if (n - f < ds_grid_width(playerActions[battleActorID.e3])) {
						speedGrid[# n, 0] = global.playerStats[battleActorID.e3][stats.spd]/(ds_grid_width(playerActions[battleActorID.e3]) - e3Actions);
						speedGrid[# n, 1] = battleActorID.e3;
						e3Actions++;
					}
					else if (n - g < ds_grid_width(playerActions[battleActorID.e4])) {
						speedGrid[# n, 0] = global.playerStats[battleActorID.e4][stats.spd]/(ds_grid_width(playerActions[battleActorID.e4]) - e4Actions);
						speedGrid[# n, 1] = battleActorID.e4;
						e4Actions++;
					}
					else if (n - h < ds_grid_width(playerActions[battleActorID.e5])) {
						speedGrid[# n, 0] = global.playerStats[battleActorID.e5][stats.spd]/(ds_grid_width(playerActions[battleActorID.e5]) - e5Actions);
						speedGrid[# n, 1] = battleActorID.e5;
						e5Actions++;
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
					tieCount = 0;
					show_debug_message("Reset all actionCount counters");
					
					//Beginning speed check
					show_debug_message("Beginning speed check");
					
					//Note for future Ammi (8/21/21):
					//Perhaps it may be better to check if all values are zeroed out rather than arbitrarily comparing n to the width of the grid.
					for (var n = 0; n > ds_grid_width(speedGrid); n++) {
						var speedCheck = ds_grid_get_max(speedGrid, 0, 0, ds_grid_width(speedGrid), ds_grid_height(speedGrid));
						for (var m = 0; speedCheck != speedGrid[# m, 0]; m++) {
							show_debug_message("Value Checking: speedGrid @ " + string(m) + " AGAINST: " + string(speedCheck));
						}
						speedGrid[# m, 0] = 0;
						show_debug_message("VALUE MATCH FOUND! speedGrid @ " + string(m));
						if (ds_grid_get_max(speedGrid, 0, 0, ds_grid_width(speedGrid), ds_grid_height(speedGrid)) == speedCheck) {
							ds_queue_enqueue(tieCount);
							tieCount++;
							speedTies[4][0] = speedGrid[# m, 1];
							do {
								for (var m = 0; speedCheck != speedGrid[# m, 0]; m++) {
									show_debug_message("Value Checking: speedGrid @ " + string(m) + " AGAINST: " + string(speedCheck));
								}
								show_debug_message("VALUE MATCH FOUND! speedGrid @ " + string(m));
								speedGrid[# m, 0] = 0;
							} until (speedCheck != ds_grid_get_max(speedGrid, 0, 0, ds_grid_width(speedGrid), ds_grid_height(speedGrid)))
						}
						else {
							ds_queue_enqueue(speedGrid[# m, 1]);
						}
					}
				}
			}
			#endregion
			#region Action Processing
			else {
				do {
					//Check if the turn we're processing is a tie.
					#region Action Processing (Ties)
					if (ds_queue_head(turnOrder) >= battleActorID.ties) {
						//If so then start processing the first action in the stack
						var tieID = ds_queue_head(turnOrder) - battleActorID.ties;
						for (var n = 0; n <= array_length(speedTies[ds_queue_head(turnOrder)]); n++) {
							var source = speedTies[tieID][n];
							switch (playerActions[speedTies[tieID][n]][# actionCount[source], actionInfo.actionID]) {
								#region Action Processing: Attack (Ties)
								case battleActions.attack:
									if ((source >= battleActorID.p1) && (battleActorID.p4)) var target = playerActions[source][# actionCount[source], actionInfo.target];
									else if ((source >= battleActorID.e1) && (battleActorID.e5)) var target = enemyActions[source - battleActorID.e1][# actionCount[source - battleActorID.e1], actionInfo.target];
									
									if ((source >= battleActorID.p1) && (source <= battleActorID.p4)) var strength = global.playerStats[source][stats.str];
									else if ((source >= battleActorID.e1) && (source <= battleActorID.e5)) var strength = enemyActions[source - battleActorID.e1][stats.str];
									
									if ((source >= battleActorID.p1) && (source <= battleActorID.p4)) var attack = global.playerStats[source][stats.atk];
									else if ((source >= battleActorID.e1) && (source <= battleActorID.e5)) var attack = enemyActions[source - battleActorID.e1][stats.atk];
									
									if ((target >= battleActorID.p1) && (target <= battleActorID.p4)) var defence = global.playerStats[target][stats.def];
									else if ((target >= battleActorID.e1) && (target <= battleActorID.e5)) var defence = enemyStats[target - battleActorID.e1][stats.def];
									
									var damage = standardAttack(strength, attack, defence);
									if ((target >= battleActorID.p1) && (target <= battleActorID.p4)) global.playerStats[target][stats.HP] -= damage;
									else if ((target >= battleActorID.e1) && (target <= battleActorID.e5)) enemyStats[target - battleActorID.e1][stats.HP] -= damage;
									break;
								#endregion
								#region Action Processing: Defend (Ties)
									case battleActions.defend:
										break;
									#endregion
								#region Action Processing: Skills (Ties)
									case battleActions.skills:
										break;
									#endregion
								#region Action Processing: Items (Ties)
									case battleActions.item:
										break;
									#endregion
								#region Action Processing: Finish (Ties)
									case battleActions.finish:
										break;
									#endregion
								#region Action Processing: Flee (Ties)
									case battleActions.flee:
										break;
									#endregion
							}
						}
						repeat (array_length(speedTies[ds_queue_head(turnOrder)])) {
								
						}
					}
					#endregion
					#region Action Processing (Solos)
					else {
							switch (ds_queue_head(turnOrder)) {
								case battleActions.attack:
									var source = ds_queue_head(turnOrder);
									if ((source >= battleActorID.p1) && (battleActorID.p4)) var target = playerActions[source][# actionCount[source], actionInfo.target];
									else if ((source >= battleActorID.e1) && (battleActorID.e5)) var target = enemyActions[source - battleActorID.e1][# actionCount[source - battleActorID.e1], actionInfo.target];
									if ((source >= battleActorID.p1) && (battleActorID.p4)) {
										if (global.playerStats[source][stats.HP] > 0) {
											if ((source >= battleActorID.p1) && (source <= battleActorID.p4)) var strength = global.playerStats[source][stats.str];
											else if ((source >= battleActorID.e1) && (source <= battleActorID.e5)) var strength = enemyActions[source - battleActorID.e1][stats.str];
											
											if ((source >= battleActorID.p1) && (source <= battleActorID.p4)) var attack = global.playerStats[source][stats.atk];
											else if ((source >= battleActorID.e1) && (source <= battleActorID.e5)) var attack = enemyActions[source - battleActorID.e1][stats.atk];
											
											if ((target >= battleActorID.p1) && (target <= battleActorID.p4)) var defence = global.playerStats[target][stats.def];
											else if ((target >= battleActorID.e1) && (target <= battleActorID.e5)) var defence = enemyStats[target - battleActorID.e1][stats.def];
											
											var damage = standardAttack(strength, attack, defence);
											if ((target >= battleActorID.p1) && (target <= battleActorID.p4)) global.playerStats[target][stats.HP] -= damage;
											else if ((target >= battleActorID.e1) && (target <= battleActorID.e5)) enemyStats[target - battleActorID.e1][stats.HP] -= damage;
										}
										else break;
									}
									else if ((source >= battleActorID.e1) && (battleActorID.e5)) {
										if (enemyStats[source - battleActorID.e1][stats.HP] > 0) {
											if ((source >= battleActorID.p1) && (source <= battleActorID.p4)) var strength = global.playerStats[source][stats.str];
											else if ((source >= battleActorID.e1) && (source <= battleActorID.e5)) var strength = enemyActions[source - battleActorID.e1][stats.str];
											
											if ((source >= battleActorID.p1) && (source <= battleActorID.p4)) var attack = global.playerStats[source][stats.atk];
											else if ((source >= battleActorID.e1) && (source <= battleActorID.e5)) var attack = enemyActions[source - battleActorID.e1][stats.atk];
											
											if ((target >= battleActorID.p1) && (target <= battleActorID.p4)) var defence = global.playerStats[target][stats.def];
											else if ((target >= battleActorID.e1) && (target <= battleActorID.e5)) var defence = enemyStats[target - battleActorID.e1][stats.def];
											
											var damage = standardAttack(strength, attack, defence);
											if ((target >= battleActorID.p1) && (target <= battleActorID.p4)) global.playerStats[target][stats.HP] -= damage;
											else if ((target >= battleActorID.e1) && (target <= battleActorID.e5)) enemyStats[target - battleActorID.e1][stats.HP] -= damage;
										}
									}
									break;
								case battleActions.defend:
									break;
								case battleActions.skills:
									break;
								case battleActions.item:
									break;
								case battleActions.flee:
									break;
								default:
									break;
							}
					}
					#endregion
					
				} until (ds_queue_empty(turnOrder))
			}
			#endregion
		}
		#endregion
	}
	#region Confirmation Box Processing
	else {
		if (inputUp || inputDown) {
			confirmSelection = !confirmSelection;
			show_debug_message("SET confirmSelection to: " + string(confirmSelection));
		}
		if inputConfirm {
			if confirmSelection {
				askForConfirmation = false;
				roundStart = false;
			}
			else {
				actionStack = ds_grid_width(playerActions[playerSelecting]) - 1;
				playerActions[playerSelecting][# actionStack, actionInfo.actionID] = battleActions.selecting;
				playerActions[playerSelecting][# actionStack, actionInfo.target] = 0;
				playerActions[playerSelecting][# actionStack, actionInfo.lookup] = 0;
			}
		}
	}
	#endregion
}
#endregion
#region Battle Finished
//If battleFinished does not equal "False" then the battle must be finished.
else {
	
}
#endregion