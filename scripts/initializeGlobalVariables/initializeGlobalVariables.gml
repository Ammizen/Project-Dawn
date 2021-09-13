function initializeGlobalVariables(){
	#region Display Variables
		//global.globalDisplayWidth = 0;
		//global.globalDisplayHeight = 0;
	#endregion
	#region Debug Variables
		global.debugMode = true;
	#endregion
	#region Player One's Stats
		global.playerStats[battleActorID.p1][stats.name] = 1;												//Player Level
		global.playerStats[battleActorID.p1][stats.maxHP] = 10000;											//Max. HP
		global.playerStats[battleActorID.p1][stats.maxMP] = 5000;											//Max. MP 
		//global.playerStats[battleActorID.p1][stats.] = 300;												//Max. SP (UNUSED)
		global.playerStats[battleActorID.p1][stats.HP] = global.playerStats[battleActorID.p1][stats.maxHP];	//Current HP
		global.playerStats[battleActorID.p1][stats.MP] = global.playerStats[battleActorID.p1][stats.maxMP];	//Current MP
		//global.playerStats[battleActorID.p1][stats.] = 300;												//Current SP (UNUSED)
		//global.playerStats[battleActorID.p1][stats.] = 1;													//Current BP (UNUSED)
		global.playerStats[battleActorID.p1][stats.atk] = 100;												//Attack
		global.playerStats[battleActorID.p1][stats.mAtk] = 50;												//Magic Attack (Wpn + E. Pro)
		global.playerStats[battleActorID.p1][stats.def] = 100;												//Defence
		global.playerStats[battleActorID.p1][stats.mDef] = 50;												//Magic Defence
		global.playerStats[battleActorID.p1][stats.spd] = 30;												//Speed
		global.playerStats[battleActorID.p1][stats.eva] = 20;												//Evasion
		global.playerStats[battleActorID.p1][stats.acc] = 100;												//Accuracy
		global.playerStats[battleActorID.p1][stats.exhaustion] = 0;											//Exhaustion
		global.playerStats[battleActorID.p1][stats.luck] = 0;												//Luck
		global.playerStats[battleActorID.p1][stats.pos] = 0;												//Position
		global.playerStats[battleActorID.p1][stats.toughness] = 0;											//Toughness
		global.playerStats[battleActorID.p1][stats.will] = 0;												//Willpower
		global.playerStats[battleActorID.p1][stats.str] = 0;												//Strength
		global.playerStats[battleActorID.p1][stats.dex] = 0;												//Dexterity
		global.playerStats[battleActorID.p1][stats.eID] = 0;												//Entity ID
		//global.playerStats[battleActorID.p1][stats.] = 0;													//UNUSED
	#endregion
	#region Player Two's Stats
		global.playerStats[1][0] = 1;		//Player Level
		global.playerStats[1][1] = 10000;	//Max. HP
		global.playerStats[1][2] = 5000;	//Max. MP
		global.playerStats[1][3] = 300;		//Max. SP
		global.playerStats[1][4] = 10000;	//Current HP
		global.playerStats[1][5] = 500;		//Current MP
		global.playerStats[1][6] = 300;		//Current SP
		global.playerStats[1][7] = 1;		//Current BP
		global.playerStats[1][8] = 50;		//Attack
		global.playerStats[1][9] = 50;		//Magic Attack (Wpn + E. Pro)
		global.playerStats[1][10] = 50;		//Defence
		global.playerStats[1][11] = 50;		//Magic Defence
		global.playerStats[1][12] = 30;		//Speed
		global.playerStats[1][13] = 20;		//Evasion
		global.playerStats[1][14] = 100;	//Accuracy
		global.playerStats[1][15] = 0;		//Exhaustion
		global.playerStats[1][16] = 0;		//Luck
		global.playerStats[1][16] = 0;		//Position
		global.playerStats[1][17] = 0;		//Toughness
		global.playerStats[1][18] = 0;		//Willpower
		global.playerStats[1][19] = 0;		//Strength
		global.playerStats[1][20] = 0;		//Dexterity
		global.playerStats[1][21] = 0;		//Entity ID
	#endregion
	#region Player Three's Stats
		global.playerStats[2][0] = 1;		//Player Level
		global.playerStats[2][1] = 10000;	//Max. HP
		global.playerStats[2][2] = 5000;	//Max. MP
		global.playerStats[2][3] = 300;		//Max. SP
		global.playerStats[2][4] = 10000;	//Current HP
		global.playerStats[2][5] = 500;		//Current MP
		global.playerStats[2][6] = 300;		//Current SP
		global.playerStats[2][7] = 1;		//Current BP
		global.playerStats[2][8] = 50;		//Attack
		global.playerStats[2][9] = 50;		//Magic Attack (Wpn + E. Pro)
		global.playerStats[2][10] = 50;		//Defence
		global.playerStats[2][11] = 50;		//Magic Defence
		global.playerStats[2][12] = 30;		//Speed
		global.playerStats[2][13] = 20;		//Evasion
		global.playerStats[2][14] = 100;	//Accuracy
		global.playerStats[2][15] = 0;		//Exhaustion
		global.playerStats[2][16] = 0;		//Luck
		global.playerStats[2][16] = 0;		//Position
		global.playerStats[2][17] = 0;		//Toughness
		global.playerStats[2][18] = 0;		//Willpower
		global.playerStats[2][19] = 0;		//Strength
		global.playerStats[2][20] = 0;		//Dexterity
		global.playerStats[2][21] = 0;		//Entity ID
	#endregion
	#region Player Four's Stats
		global.playerStats[3][0] = 1;		//Player Level
		global.playerStats[3][1] = 10000;	//Max. HP
		global.playerStats[3][2] = 5000;		//Max. MP
		global.playerStats[3][3] = 300;		//Max. SP
		global.playerStats[3][4] = 10000;	//Current HP
		global.playerStats[3][5] = 500;		//Current MP
		global.playerStats[3][6] = 300;		//Current SP
		global.playerStats[3][7] = 1;		//Current BP
		global.playerStats[3][8] = 50;		//Attack
		global.playerStats[3][9] = 50;		//Magic Attack (Wpn + E. Pro)
		global.playerStats[3][10] = 50;		//Defence
		global.playerStats[3][11] = 50;		//Magic Defence
		global.playerStats[3][12] = 30;		//Speed
		global.playerStats[3][13] = 20;		//Evasion
		global.playerStats[3][14] = 100;		//Accuracy
		global.playerStats[3][15] = 0;		//Exhaustion
		global.playerStats[3][16] = 0;		//Luck
		global.playerStats[3][16] = 0;		//Position
		global.playerStats[3][17] = 0;		//Toughness
		global.playerStats[3][18] = 0;		//Willpower
		global.playerStats[3][19] = 0;		//Strength
		global.playerStats[3][20] = 0;		//Dexterity
		global.playerStats[3][21] = 0;		//Entity ID
		
	#endregion	
	#region Misc Variables
		global.enemyA_ID = undefined;
		global.enemyB_ID = undefined;
		global.enemyC_ID = undefined;
		global.enemyD_ID = undefined;
		global.enemyE_ID = undefined;
	#endregion
}