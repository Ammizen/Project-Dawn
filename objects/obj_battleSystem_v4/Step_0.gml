///@desc Main Battle Process
#region Main Battle Process
if (!battleFinished && !gameover) {
	if roundStart {
		if askForConfirmation {
			/*	
			Note for future Ammi (Written on: 07/24/21 @ 05:30): 
			Perhaps it would be better to move the "Skill" and "Item" actions to their own code files...
			This way we can loop the extra code file and reuse it. For now, I shall focus on getting the 
			rest of the system to work. Bit by bit, slowly making progress.
			*/
			
			switch (playerActions[playerSelecting][# actionStack, actionInfo.actionID]) {
				
			}
		}
	}
	else {
		
	}
}
#endregion
#region Game Over code
else if (gameover) {
	
}
#endregion
#region Battle Finished code
else if (battleFinished) {
	
}
#endregion