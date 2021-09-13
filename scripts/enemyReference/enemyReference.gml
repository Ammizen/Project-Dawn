///@description Enemy Information Reference
///@arg1 Enemy_ID
///@arg2 Stat_Lookup
function enemyReference(_id, _stat){
	switch _id {
		#region TEST ENEMY (ID: 0)
			case 0:
				switch _stat {
					
					//Enemy Name
					case stats.name:
						return "DEBUG ENEMY";
						break;
						
					//Max. HP
					case stats.maxHP:
						return 5000;
						break;
					
					//Max. MP
					case 2:
						return 0;
						break;
						
					//Max. SP
					case 3:
						return 0;
						break;
						
					//Current HP (Unused)
					case 4:
						return 0;
						break;
						
					//Current MP (Unused)
					case 5:
						return 0;
						break;
						
					//Current SP (Unused)
					case 6:
						return 0;
						break;
						
					//Current BP
					case 7:
						return 0;
						break;
						
					//Attack
					case 8:
						return 100;
						break;
						
					//Magic Attack
					case 9:
						return 0;
						break;
				
					//Defence
					case 10:
						return 50;
						break;
					
					//Magic Defence
					case 11:
						return 0;
						break;
						
					//Speed
					case 12:
						return 0;
						break;
						
					//Evasion
					case 13:
						return 0;
						break;
						
					//Accuracy
					case 14:
						return 0;
						break;
						
					//Exhaustion (Unused)
					case 15:
						return 0;
						break;
						
					//Enemy Image
					case 16:
						return spr_placeholderEnemy;
						break;
						
					//Enemy Luck (Unused)
					case 17:
						return 0;
						break;
					
					//Exp Drop
					case 18:
						return irandom_range(0, 0);
						break;
						
					//Item Drop
					case 19:
						return choose("debug");
						break;
				}
				break;
		#endregion
	}
}