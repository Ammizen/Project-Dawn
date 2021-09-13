///@description Variables

#region Variables for Drawing HUD
cursorAnim = false;
cursorAnimCounter = 0;
cursorSelection = battleActions.attack;
#endregion

#region Variables for Drawing Actors
enemyCount = !is_undefined(global.enemyA_ID) + 
	!is_undefined(global.enemyB_ID) + 
	!is_undefined(global.enemyC_ID) + 
	!is_undefined(global.enemyD_ID) + 
	!is_undefined(global.enemyE_ID);
	
//playerCount = !is_undefined(global.global.playerStats[battleActorID.p1][stats.eID])
#endregion

atkVariation = 0.05;
damage = 0;

xpTotal = 0;

roundStart = true;
battleFinished = false;
soundFinished = false;
system_BGM = audio_play_sound(snd_battleIntro, 1, false);
alarm[0] = audio_sound_length(snd_battleIntro) * room_speed - 2;

askForConfirmation = false;
historyIndex = 0;

// CODE REMOVED HERE: Refer to oldCode_playerAction-enemyAction.txt to review.

playerActions[0] = ds_grid_create(1, 4);
show_debug_message("EVENT LOG: CREATED playerActions[0]." + "\n" + "DATA TYPE: ds_grid");
playerActions[1] = ds_grid_create(1, 4);
show_debug_message("EVENT LOG: CREATED playerActions[1]." + "\n" + "DATA TYPE: ds_grid");
playerActions[2] = ds_grid_create(1, 4);
show_debug_message("EVENT LOG: CREATED playerActions[2]." + "\n" + "DATA TYPE: ds_grid");
playerActions[3] = ds_grid_create(1, 4);
show_debug_message("EVENT LOG: CREATED playerActions[3]." + "\n" + "DATA TYPE: ds_grid");

enemyActions[0] = ds_grid_create(5, 4);
show_debug_message("EVENT LOG: CREATED enemyActions[0]." + "\n" + "DATA TYPE: ds_grid");
enemyActions[1] = ds_grid_create(5, 4);
show_debug_message("EVENT LOG: CREATED enemyActions[1]." + "\n" + "DATA TYPE: ds_grid");
enemyActions[2] = ds_grid_create(5, 4);
show_debug_message("EVENT LOG: CREATED enemyActions[2]." + "\n" + "DATA TYPE: ds_grid");
enemyActions[3] = ds_grid_create(5, 4);
show_debug_message("EVENT LOG: CREATED enemyActions[3]." + "\n" + "DATA TYPE: ds_grid");
enemyActions[4] = ds_grid_create(5, 4);
show_debug_message("EVENT LOG: CREATED enemyActions[4]." + "\n" + "DATA TYPE: ds_grid");


actionCounter = 0;
confirmSelection = true;
enemyTurn = false;
turnOrderSet = false;
actionStack = 0;
playerSelecting = 0;
menuPulsar = 0;
menuPulsarDirection = true;
actionComplete = false;
enemySelection = 0;
alarm[3] = 1;
actionCount[battleActorID.p1] = 0;
actionCount[battleActorID.p2] = 0;
actionCount[battleActorID.p3] = 0;
actionCount[battleActorID.p4] = 0;
actionCount[battleActorID.e1] = 0;
actionCount[battleActorID.e2] = 0;
actionCount[battleActorID.e3] = 0;
actionCount[battleActorID.e4] = 0;
actionCount[battleActorID.e5] = 0;

turnOrder = ds_queue_create();

#region Enemy Stats
#region Enemy Location 1

//Check if an enemy is loaded.
if (global.enemyA_ID != undefined) {
	global.enemyStats[0][0] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[0][1] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[0][2] = enemyReference(0, stats.maxMP);		//Max. MP 
	//global.enemyStats[0][3] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[0][4] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[0][5] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[0][6] = global.enemyStats[0][3];				//Current SP 
	global.enemyStats[0][7] = 1;									//Current BP 
	global.enemyStats[0][8] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[0][9] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[0][10] = enemyReference(0, stats.def);		//Defence 
	global.enemyStats[0][11] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[0][12] = enemyReference(0, stats.spd);		//Speed 
	global.enemyStats[0][13] = enemyReference(0, stats.eva);		//Evasion 
	global.enemyStats[0][14] = enemyReference(0, stats.acc);		//Accuracy
	global.enemyStats[0][15] = 0;									//Exhaustion
	//global.enemyStats[0][16] = enemyReference(0, stats.image);	//Enemy Image (UNUSED)
}
#endregion
#region Enemy Location 2

//Check if an enemy is loaded.
if (global.enemyB_ID != undefined) {
	global.enemyStats[1][0] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[1][1] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[1][2] = enemyReference(0, stats.maxMP);		//Max. MP 
	//global.enemyStats[1][3] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[1][4] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[1][5] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[1][6] = global.enemyStats[0][3];				//Current SP 
	global.enemyStats[1][7] = 1;									//Current BP 
	global.enemyStats[1][8] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[1][9] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[1][10] = enemyReference(0, stats.def);		//Defence 
	global.enemyStats[1][11] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[1][12] = enemyReference(0, stats.spd);		//Speed 
	global.enemyStats[1][13] = enemyReference(0, stats.eva);		//Evasion 
	global.enemyStats[1][14] = enemyReference(0, stats.acc);		//Accuracy
	global.enemyStats[1][15] = 0;									//Exhaustion
	//global.enemyStats[1][16] = enemyReference(0, stats.image);	//Enemy Image (UNUSED)
}
#endregion
#region Enemy Location 3

//Check if an enemy is loaded.
if (global.enemyC_ID != undefined) {
	global.enemyStats[2][0] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[2][1] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[2][2] = enemyReference(0, stats.maxMP);		//Max. MP 
	//global.enemyStats[2][3] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[2][4] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[2][5] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[2][6] = global.enemyStats[0][3];				//Current SP 
	global.enemyStats[2][7] = 1;									//Current BP 
	global.enemyStats[2][8] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[2][9] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[2][10] = enemyReference(0, stats.def);		//Defence 
	global.enemyStats[2][11] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[2][12] = enemyReference(0, stats.spd);		//Speed 
	global.enemyStats[2][13] = enemyReference(0, stats.eva);		//Evasion 
	global.enemyStats[2][14] = enemyReference(0, stats.acc);		//Accuracy
	global.enemyStats[2][15] = 0;									//Exhaustion
	//global.enemyStats[2][16] = enemyReference(0, stats.image);	//Enemy Image (UNUSED)
}
#endregion
#region Enemy Location 4

//Check if an enemy is loaded.
if (global.enemyD_ID != undefined) {
	global.enemyStats[3][0] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[3][1] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[3][2] = enemyReference(0, stats.maxMP);		//Max. MP 
	//global.enemyStats[3][3] = enemyReference(0, stats.maxSP);		//Max. SP 
	global.enemyStats[3][4] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[3][5] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[3][6] = global.enemyStats[0][3];				//Current SP 
	global.enemyStats[3][7] = 1;									//Current BP 
	global.enemyStats[3][8] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[3][9] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[3][10] = enemyReference(0, stats.def);		//Defence 
	global.enemyStats[3][11] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[3][12] = enemyReference(0, stats.spd);		//Speed 
	global.enemyStats[3][13] = enemyReference(0, stats.eva);		//Evasion 
	global.enemyStats[3][14] = enemyReference(0, stats.acc);		//Accuracy
	global.enemyStats[3][15] = 0;									//Exhaustion
	//global.enemyStats[3][16] = enemyReference(0, stats.image);	//Enemy Image
}
#endregion
#region Enemy Location 5

//Check if an enemy is loaded.
if (global.enemyE_ID != undefined) {
	global.enemyStats[4][0] = enemyReference(0, stats.name);   //Enemy Name
	global.enemyStats[4][1] = enemyReference(0, stats.maxHP);  //Max. HP 
	global.enemyStats[4][2] = enemyReference(0, stats.maxMP);  //Max. MP 
	//global.enemyStats[4][3] = enemyReference(0, stats.maxSP);  //Max. SP 
	global.enemyStats[4][4] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[4][5] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[4][6] = global.enemyStats[0][3];				//Current SP 
	global.enemyStats[4][7] = 1;									//Current BP 
	global.enemyStats[4][8] = enemyReference(0, stats.atk);	//Attack 
	global.enemyStats[4][9] = enemyReference(0, stats.mAtk);	//Magic Attack 
	global.enemyStats[4][10] = enemyReference(0, stats.def);	//Defence 
	global.enemyStats[4][11] = enemyReference(0, stats.mDef);	//Magic Defence 
	global.enemyStats[4][12] = enemyReference(0, stats.spd);	//Speed 
	global.enemyStats[4][13] = enemyReference(0, stats.eva);	//Evasion 
	global.enemyStats[4][14] = enemyReference(0, stats.acc);	//Accuracy
	global.enemyStats[4][15] = 0;									//Exhaustion
	//global.enemyStats[4][16] = enemyReference(0, stats.image);	//Enemy Image
}
#endregion
#endregion