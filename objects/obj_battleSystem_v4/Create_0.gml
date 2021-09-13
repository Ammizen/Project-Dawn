///@description Dynamic Resources (Arrays and Data Structures)

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
#region Misc Variables
atkVariation = 0.05;
damage = 0;

xpTotal = 0;

roundStart = true;
battleFinished = false;
gameover = false;
soundFinished = false;
system_BGM = audio_play_sound(snd_battleIntro, 1, false);
alarm[0] = audio_sound_length(snd_battleIntro) * room_speed - 2;

askForConfirmation = false;
historyIndex = 0;

// CODE REMOVED HERE: Refer to oldCode_playerAction-enemyAction.txt to review.

//playerActions[0] = ds_grid_create(1, 4);
//show_debug_message("EVENT LOG: CREATED playerActions[0]." + "\n" + "DATA TYPE: ds_grid");
//playerActions[1] = ds_grid_create(1, 4);
//show_debug_message("EVENT LOG: CREATED playerActions[1]." + "\n" + "DATA TYPE: ds_grid");
//playerActions[2] = ds_grid_create(1, 4);
//show_debug_message("EVENT LOG: CREATED playerActions[2]." + "\n" + "DATA TYPE: ds_grid");
//playerActions[3] = ds_grid_create(1, 4);
//show_debug_message("EVENT LOG: CREATED playerActions[3]." + "\n" + "DATA TYPE: ds_grid");

//enemyActions[0] = ds_grid_create(5, 4);
//show_debug_message("EVENT LOG: CREATED enemyActions[0]." + "\n" + "DATA TYPE: ds_grid");
//enemyActions[1] = ds_grid_create(5, 4);
//show_debug_message("EVENT LOG: CREATED enemyActions[1]." + "\n" + "DATA TYPE: ds_grid");
//enemyActions[2] = ds_grid_create(5, 4);
//show_debug_message("EVENT LOG: CREATED enemyActions[2]." + "\n" + "DATA TYPE: ds_grid");
//enemyActions[3] = ds_grid_create(5, 4);
//show_debug_message("EVENT LOG: CREATED enemyActions[3]." + "\n" + "DATA TYPE: ds_grid");
//enemyActions[4] = ds_grid_create(5, 4);
//show_debug_message("EVENT LOG: CREATED enemyActions[4]." + "\n" + "DATA TYPE: ds_grid");

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
#endregion
#region Enemy Stats
#region Enemy Location 1
//Check if an enemy is loaded.
if (global.enemyA_ID != undefined) {
	global.enemyStats[battleActorID.e1][stats.name] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[battleActorID.e1][stats.maxHP] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[battleActorID.e1][stats.maxMP] = enemyReference(0, stats.maxMP);		//Max. MP 
	global.enemyStats[battleActorID.e1][stats.maxSP] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[battleActorID.e1][stats.HP] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[battleActorID.e1][stats.MP] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[battleActorID.e1][stats.SP] = global.enemyStats[0][3];				//Current SP
	global.enemyStats[battleActorID.e1][stats.atk] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[battleActorID.e1][stats.mAtk] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[battleActorID.e1][stats.def] = enemyReference(0, stats.def);			//Defence 
	global.enemyStats[battleActorID.e1][stats.mDef] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[battleActorID.e1][stats.spd] = enemyReference(0, stats.spd);			//Speed 
	global.enemyStats[battleActorID.e1][stats.eva] = enemyReference(0, stats.eva);			//Evasion 
	global.enemyStats[battleActorID.e1][stats.acc] = enemyReference(0, stats.acc);			//Accuracy
	global.enemyStats[battleActorID.e1][stats.exhaustion] = 0;								//Exhaustion
	global.enemyStats[battleActorID.e1][stats.imageID] = enemyReference(0, stats.imageID);	//Enemy Image (UNUSED)
}
#endregion
#region Enemy Location 2
//Check if an enemy is loaded.
if (global.enemyB_ID != undefined) {
	global.enemyStats[battleActorID.e2][stats.name] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[battleActorID.e2][stats.maxHP] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[battleActorID.e2][stats.maxMP] = enemyReference(0, stats.maxMP);		//Max. MP 
	global.enemyStats[battleActorID.e2][stats.maxSP] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[battleActorID.e2][stats.HP] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[battleActorID.e2][stats.MP] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[battleActorID.e2][stats.SP] = global.enemyStats[0][3];				//Current SP
	global.enemyStats[battleActorID.e2][stats.atk] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[battleActorID.e2][stats.mAtk] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[battleActorID.e2][stats.def] = enemyReference(0, stats.def);			//Defence 
	global.enemyStats[battleActorID.e2][stats.mDef] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[battleActorID.e2][stats.spd] = enemyReference(0, stats.spd);			//Speed 
	global.enemyStats[battleActorID.e2][stats.eva] = enemyReference(0, stats.eva);			//Evasion 
	global.enemyStats[battleActorID.e2][stats.acc] = enemyReference(0, stats.acc);			//Accuracy
	global.enemyStats[battleActorID.e2][stats.exhaustion] = 0;								//Exhaustion
	global.enemyStats[battleActorID.e2][stats.imageID] = enemyReference(0, stats.imageID);	//Enemy Image (UNUSED)
}
#endregion
#region Enemy Location 3
//Check if an enemy is loaded.
if (global.enemyC_ID != undefined) {
	global.enemyStats[battleActorID.e3][stats.name] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[battleActorID.e3][stats.maxHP] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[battleActorID.e3][stats.maxMP] = enemyReference(0, stats.maxMP);		//Max. MP 
	global.enemyStats[battleActorID.e3][stats.maxSP] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[battleActorID.e3][stats.HP] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[battleActorID.e3][stats.MP] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[battleActorID.e3][stats.SP] = global.enemyStats[0][3];				//Current SP
	global.enemyStats[battleActorID.e3][stats.atk] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[battleActorID.e3][stats.mAtk] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[battleActorID.e3][stats.def] = enemyReference(0, stats.def);			//Defence 
	global.enemyStats[battleActorID.e3][stats.mDef] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[battleActorID.e3][stats.spd] = enemyReference(0, stats.spd);			//Speed 
	global.enemyStats[battleActorID.e3][stats.eva] = enemyReference(0, stats.eva);			//Evasion 
	global.enemyStats[battleActorID.e3][stats.acc] = enemyReference(0, stats.acc);			//Accuracy
	global.enemyStats[battleActorID.e3][stats.exhaustion] = 0;								//Exhaustion
	global.enemyStats[battleActorID.e3][stats.imageID] = enemyReference(0, stats.imageID);	//Enemy Image (UNUSED)
}
#endregion
#region Enemy Location 4
//Check if an enemy is loaded.
if (global.enemyD_ID != undefined) {
	global.enemyStats[battleActorID.e4][stats.name] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[battleActorID.e4][stats.maxHP] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[battleActorID.e4][stats.maxMP] = enemyReference(0, stats.maxMP);		//Max. MP 
	global.enemyStats[battleActorID.e4][stats.maxSP] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[battleActorID.e4][stats.HP] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[battleActorID.e4][stats.MP] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[battleActorID.e4][stats.SP] = global.enemyStats[0][3];				//Current SP
	global.enemyStats[battleActorID.e4][stats.atk] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[battleActorID.e4][stats.mAtk] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[battleActorID.e4][stats.def] = enemyReference(0, stats.def);			//Defence 
	global.enemyStats[battleActorID.e4][stats.mDef] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[battleActorID.e4][stats.spd] = enemyReference(0, stats.spd);			//Speed 
	global.enemyStats[battleActorID.e4][stats.eva] = enemyReference(0, stats.eva);			//Evasion 
	global.enemyStats[battleActorID.e4][stats.acc] = enemyReference(0, stats.acc);			//Accuracy
	global.enemyStats[battleActorID.e4][stats.exhaustion] = 0;								//Exhaustion
	global.enemyStats[battleActorID.e4][stats.imageID] = enemyReference(0, stats.imageID);	//Enemy Image (UNUSED)
}
#endregion
#region Enemy Location 5
//Check if an enemy is loaded.
if (global.enemyE_ID != undefined) {
	global.enemyStats[battleActorID.e5][stats.name] = enemyReference(0, stats.name);		//Enemy Name
	global.enemyStats[battleActorID.e5][stats.maxHP] = enemyReference(0, stats.maxHP);		//Max. HP 
	global.enemyStats[battleActorID.e5][stats.maxMP] = enemyReference(0, stats.maxMP);		//Max. MP 
	global.enemyStats[battleActorID.e5][stats.maxSP] = enemyReference(0, stats.maxSP);		//Max. SP (UNUSED)
	global.enemyStats[battleActorID.e5][stats.HP] = global.enemyStats[0][1];				//Current HP 
	global.enemyStats[battleActorID.e5][stats.MP] = global.enemyStats[0][2];				//Current MP 
	global.enemyStats[battleActorID.e5][stats.SP] = global.enemyStats[0][3];				//Current SP
	global.enemyStats[battleActorID.e5][stats.atk] = enemyReference(0, stats.atk);			//Attack 
	global.enemyStats[battleActorID.e5][stats.mAtk] = enemyReference(0, stats.mAtk);		//Magic Attack 
	global.enemyStats[battleActorID.e5][stats.def] = enemyReference(0, stats.def);			//Defence 
	global.enemyStats[battleActorID.e5][stats.mDef] = enemyReference(0, stats.mDef);		//Magic Defence 
	global.enemyStats[battleActorID.e5][stats.spd] = enemyReference(0, stats.spd);			//Speed 
	global.enemyStats[battleActorID.e5][stats.eva] = enemyReference(0, stats.eva);			//Evasion 
	global.enemyStats[battleActorID.e5][stats.acc] = enemyReference(0, stats.acc);			//Accuracy
	global.enemyStats[battleActorID.e5][stats.exhaustion] = 0;								//Exhaustion
	global.enemyStats[battleActorID.e5][stats.imageID] = enemyReference(0, stats.imageID);	//Enemy Image (UNUSED)
}
#endregion
#endregion