/// @description Drawing HUD

/// @description HUD

#region Cursor Animation code
	if (cursorAnimCounter >= room_speed/5) {
	
		// All cursors are two frames, so we can use a standard inversion code to flip the values
		// Remember false = 0, true = 1;
		cursorAnim = !cursorAnim;
		cursorAnimCounter = 0;
	}
	cursorAnimCounter++;
#endregion

#region Battle Box Outline and base
	draw_set_alpha(0.5);
	draw_roundrect_color_ext(battleHudX, battleHudY, battleHudX + battleHudWidth, battleHudY + battleHudHeight, 30, 30, c_blue, c_blue, false);

	draw_set_alpha(1);
	draw_roundrect_color_ext(battleHudX, battleHudY, battleHudX + battleHudWidth, battleHudY + battleHudHeight, 30, 30, c_white, c_white, true);
	draw_line_color(battleBoxBreakLineX, battleHudY, battleBoxBreakLineX, battleHudY + battleHudHeight, c_white, c_white);
#endregion

#region Draw Enemy Names and Health
	draw_set_font(fnt_battle);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text_transformed(battleEnemyNamePosX, battleEnemyNamePosY + battleEnemyNameSpacer * 0, "enemy 1 - " + string(global.enemyStats[0][stats.HP]), battleDialogTextScale, battleDialogTextScale, 0);
	draw_text_transformed(battleEnemyNamePosX, battleEnemyNamePosY + battleEnemyNameSpacer * 1, "enemy 2 - " + string(global.enemyStats[1][stats.HP]), battleDialogTextScale, battleDialogTextScale, 0);
	draw_text_transformed(battleEnemyNamePosX, battleEnemyNamePosY + battleEnemyNameSpacer * 2, "enemy 3 - " + string(global.enemyStats[2][stats.HP]), battleDialogTextScale, battleDialogTextScale, 0);
	draw_text_transformed(battleEnemyNamePosX, battleEnemyNamePosY + battleEnemyNameSpacer * 3, "enemy 4 - " + string(global.enemyStats[3][stats.HP]), battleDialogTextScale, battleDialogTextScale, 0);
	draw_text_transformed(battleEnemyNamePosX, battleEnemyNamePosY + battleEnemyNameSpacer * 4, "enemy 5 - " + string(global.enemyStats[4][stats.HP]), battleDialogTextScale, battleDialogTextScale, 0);
#endregion																											

#region Draw Player Names and quick stats

#region Player 1's stats
	draw_text_transformed(battlePlayerNamePosX, battlePlayerNamePosY + battlePlayerNameSpacer * 0, "Lysine", battleNameScale, battleNameScale, 0);
	//draw_rectangle_color(battlePlayerHealthBarX, battlePlayerHealthBarY, battlePlayerHealthBarWidth, battlePlayerHealthBarHeight, c_black, c_black, c_black, c_black, false);
	//draw_rectangle_color(battlePlayerHealthBarX, battlePlayerHealthBarY, battlePlayerHealthBarWidth * (global.playerCurrentHP/global.playerHP), battlePlayerHealthBarHeight, c_red, c_red, c_red, c_red, false);
#endregion

#region Player 2's stats
	draw_text_transformed(battlePlayerNamePosX, battlePlayerNamePosY + battlePlayerNameSpacer * 1, "Player 2", battleNameScale, battleNameScale, 0);
#endregion

#region Player 3's stats
	draw_text_transformed(battlePlayerNamePosX, battlePlayerNamePosY + battlePlayerNameSpacer * 2, "Player 3", battleNameScale, battleNameScale, 0);
#endregion

#region Player 4's stats
	draw_text_transformed(battlePlayerNamePosX, battlePlayerNamePosY + battlePlayerNameSpacer * 3, "Player 4", battleNameScale, battleNameScale, 0);
#endregion

#endregion

#region Battle Action Menu

//Check if the battle has already been finished and whether or not it is the selection phase.
if (!battleFinished && roundStart) {
	// If so, then draw the action box.
	
	draw_roundrect_color_ext(battleMenuX, battleMenuY, battleMenuWidth, battleMenuHeight, 50, 50, c_blue, c_blue, false);
	draw_roundrect_color_ext(battleMenuX, battleMenuY, battleMenuWidth, battleMenuHeight, 50, 50, c_white, c_white, true);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	var textPosY = battleMenuTextPosY_base;
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text_transformed(battleMenuTextPosX, textPosY, "Attack", battleMenuTextScale, battleMenuTextScale, 0);
	textPosY += battleMenuTextSpacer;
	
	draw_text_transformed(battleMenuTextPosX, textPosY, "Defend", battleMenuTextScale, battleMenuTextScale, 0);
	textPosY += battleMenuTextSpacer;
	
	draw_text_transformed(battleMenuTextPosX, textPosY, "Skills", battleMenuTextScale, battleMenuTextScale, 0);
	textPosY += battleMenuTextSpacer;
	
	draw_text_transformed(battleMenuTextPosX, textPosY, "Items", battleMenuTextScale, battleMenuTextScale, 0);
	textPosY += battleMenuTextSpacer;
	
	draw_text_transformed(battleMenuTextPosX, textPosY, "Finish", battleMenuTextScale, battleMenuTextScale, 0);
	textPosY += battleMenuTextSpacer;
	
	draw_text_transformed(battleMenuTextPosX, textPosY, "Flee", battleMenuTextScale, battleMenuTextScale, 0);
	
	if (!askForConfirmation) {
		if (playerActions[playerSelecting][# actionStack, 0] == battleActions.selecting) {
		
			draw_sprite(spr_cursor1, cursorAnim, battleMenuCursorPosX, battleMenuTextPosY_base + (cursorSelection - 1) * battleMenuTextSpacer);
			draw_set_alpha(lerp(0.85, 0.5, menuPulsar/room_speed));
			draw_rectangle_color(battleBoxBreakLineX, battleHudY, battleMenuX, battlePlayerNamePosY + battlePlayerNameSpacer, c_white, c_white, c_white, c_white, false);
		
			if menuPulsarDirection menuPulsar++;
			else menuPulsar--;
		
			if (menuPulsar > room_speed || menuPulsar < 0) menuPulsarDirection = !menuPulsarDirection;
		}
	
		else if (playerActions[playerSelecting][# actionStack, 0] == battleActions.attack) {
			//draw_sprite(spr_cursor3, cursorAnim, 5 + string_width(string(enemyStats[enemySelection][stats.name]) + " - " + string(enemyStats[enemySelection][stats.HP])) + 5, battleEnemyNamePosY + (battleEnemyNameSpacer * enemySelection) + string_height(string(enemyStats[enemySelection][stats.name]) + " - " + string(enemyStats[enemySelection][stats.HP]))/2);
			draw_sprite(spr_cursor3, cursorAnim, battleHudX + 5, battleEnemyNamePosY + (battleEnemyNameSpacer * enemySelection) + (string_height("ENEMY")/2));
		}
	
		else if (playerActions[playerSelecting][# actionStack, 0] == -1) {

		}
	}
}

#endregion

#region Confirm Box

if askForConfirmation {
	draw_roundrect_color(battleConfirmBoxX, battleConfirmBoxY, battleConfirmBoxWidth, battleConfirmBoxHeight, c_blue, c_blue, false);
	draw_roundrect_color(battleConfirmBoxX, battleConfirmBoxY, battleConfirmBoxWidth, battleConfirmBoxHeight, c_white, c_white, true);
	
	draw_set_valign(fa_top);
	
	var confirmTextPosX = battleConfirmBoxX + (battleConfirmBoxWidth - battleConfirmBoxX)/2
	
	draw_text_transformed(confirmTextPosX, battleConfirmBoxY + string_height("Confirm?")/2, "Confirm?", 1.25, 1.25, 0);
	
	//Shift the text to three quarters the confirm box.
	
	draw_set_halign(fa_left);
	
	confirmTextPosX = battleConfirmBoxX + ((battleConfirmBoxWidth - battleConfirmBoxX)/2);
	var confirmTextPosY = battleConfirmBoxY + (battleConfirmBoxHeight - battleConfirmBoxY)/3;
	
	draw_text(confirmTextPosX, confirmTextPosY, "Yes");
	draw_text(confirmTextPosX + 2, confirmTextPosY + battleConfirmBoxSpacer, "No");
	
	var confirmCursorPosX = battleConfirmBoxX + 5;
	var confirmCursorPosY = (battleConfirmBoxY + ((confirmSelection + 1) * (battleConfirmBoxHeight - battleConfirmBoxY))/3) + string_height("Yes")/2
	
	draw_sprite(spr_cursor1, cursorAnim, confirmCursorPosX, confirmCursorPosY);
}

#endregion

// Draw battle menu on player's turn, but only if we haven't already selected a command.
//if (!battleFinished && action = -1) {
//	if (turn == battleTurns.player) {
//		draw_rectangle_color(battleMenuX, battleMenuY, battleMenuWidth, battleMenuHeight, c_blue, c_blue, c_blue, c_blue, false);
//		draw_rectangle_color(battleMenuX, battleMenuY, battleMenuWidth, battleMenuHeight, c_white, c_white, c_white, c_white, true);
		
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_center);
		
//		var textPosY = battleMenuTextPosY_base;
	
//		draw_text_transformed_color(battleMenuTextPosX, textPosY, "Attack", battleDialogTextScale, battleDialogTextScale, 0, c_grey, c_grey, c_grey, c_grey, 1);
//		textPosY += battleMenuTextSpacer;
	
//		draw_text_transformed_color(battleMenuTextPosX, textPosY, "Defend", battleDialogTextScale, battleDialogTextScale, 0, c_grey, c_grey, c_grey, c_grey, 1);
//		textPosY += battleMenuTextSpacer;
	
//		draw_text_transformed_color(battleMenuTextPosX, textPosY, "Items", battleDialogTextScale, battleDialogTextScale, 0, c_grey, c_grey, c_grey, c_grey, 1);
//		textPosY += battleMenuTextSpacer;
	
//		draw_text_transformed_color(battleMenuTextPosX, textPosY, "Flee", battleDialogTextScale, battleDialogTextScale, 0, c_grey, c_grey, c_grey, c_grey, 1);
	
//		draw_sprite(spr_cursor1, cursorAnim, battleMenuX + 34, battleMenuTextPosY_base + cursorSelection * battleMenuTextSpacer);
//	}
//}

//// Draw Dialog Box to describe actions
//else if (!battleWon && action != -1) {
//	draw_set_alpha(0.5);
//	draw_roundrect_color_ext(battleDialogBoxX, battleDialogBoxY, battleDialogBoxWidth, battleDialogBoxHeight, 50, 50, c_blue, c_blue, false);

//	draw_roundrect_color_ext(battleDialogBoxX, battleDialogBoxY, battleDialogBoxWidth, battleDialogBoxHeight, 50, 50, c_white, c_white, true);
	
//	draw_set_halign(fa_left);
//	draw_set_valign(fa_top);
//	draw_set_alpha(1);
	
//	switch turn {
//		case battleTurns.player:
//			switch action {
				
//				// When the player takes the attack action.
//				case battleActions.attack:
//					var displayText = "Player Attacks! \nEnemy took " + string(damage) + " damage!";
//					if (enemy[0, 1] <= damage) displayText = string(displayText) + "\nEnemy was slain!";
//					draw_text(battleDialogTextPosX, battleDialogTextPosY, displayText);
//					draw_sprite(spr_cursor2, cursorAnim, battleDialogCursorPosX, battleDialogCursorPosY);
					
//					break;
//			}
//			break;
			
//		case battleTurns.enemy:
//			switch action {
				
//				// When the enemy attacks the player.
//				case battleActions.attack:
				
//					draw_text(battleDialogTextPosX, battleDialogTextPosY, "Enemy Attacks! \nPlayer takes " + string(damage) + " damage!");
//					draw_sprite(spr_cursor2, cursorAnim, battleDialogCursorPosX, battleDialogCursorPosY);
//					break;
					
//			}
//			break;
//	}
//}

else if battleFinished {
	draw_set_alpha(0.5);
	draw_roundrect_color_ext(battleDialogBoxX, battleDialogBoxY, battleDialogBoxWidth, battleDialogBoxHeight, 50, 50, c_blue, c_blue, false);
	draw_roundrect_color_ext(battleDialogBoxX, battleDialogBoxY, battleDialogBoxWidth, battleDialogBoxHeight, 50, 50, c_white, c_white, true);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	
	draw_text(battleDialogTextPosX, battleDialogTextPosY, "Battle Won! \nEXP Awarded: 0 Because fuck you.");
	draw_sprite(spr_cursor2, cursorAnim, battleDialogCursorPosX, battleDialogCursorPosY);
}

#region Debug Menu
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_rectangle_color(1000, 0, room_width, room_height, c_blue, c_blue, c_blue, c_blue, false);
draw_rectangle_color(1000, 0, room_width, room_height, c_white, c_white, c_white, c_white, true);

draw_text_transformed(battleDebugTextX, battleDebugTextY, "DEBUG MENU", 1.5, 1.5, 0)

//Drawing all selected actions to the menu
//for (var n = 0; n < 4; n++) {
//	for (var m = 0; playerActions[n][# m, actionInfo.actionID] != battleActions.selecting; m++) {
//		switch (playerActions[n][# m, 0]) {
//			case battleActions.attack:
//				draw_text()
//				break;
				
//			case battleActions.defend:
//				break;
				
//			case battleActions.skills:
//				break;
				
//			case battleActions.item:
//				break;
				
//			case battleActions.finish:
//				break;
				
//			case battleActions.flee:
//				break;
				
//			default:
//				break;
//		}
//	}
//}

draw_set_alpha(1);
draw_set_halign(fa_middle);
draw_set_font(fnt_battle);
var yy = 50;
var xx = string_width("Player 1")/2 + battleDebugMenuX + 25;
draw_text(xx, yy, "Player 1");
xx += (string_width("Player 2")/2) + (string_width("Player 1")/2) + 65;
draw_text(xx, yy, "Player 2");
xx += (string_width("Player 2")/2) + (string_width("Player 1")/2) + 65;
draw_text(xx, yy, "Player 3");
xx += (string_width("Player 2")/2) + (string_width("Player 1")/2) + 65;
draw_text(xx, yy, "Player 4");
var xx = string_width("Player 1")/2 + battleDebugMenuX + 25;
for (var n = 0; playerActions[n][# 0, actionInfo.actionID] != battleActions.selecting; n++;) {
	for (var m = 0; playerActions[n][# m, actionInfo.actionID] != battleActions.selecting; m++) {
		switch (playerActions[n][# m, actionInfo.actionID]) {
			case battleActions.attack:
				draw_text(xx, yy + 25 * m + 25, "Attack: "  + string(playerActions[n][# m, actionInfo.target] + 1));
				break;
				
			case battleActions.defend:
				draw_text(xx, yy + 25 * m + 25, "Defending");
				break;
				
			case battleActions.skills:
				draw_text(xx, yy + 25 * m + 25, "Skill: ");
				break;
				
			case battleActions.item:
				draw_text(xx, yy + 25 * m + 25, "Item: ");
				break;
				
			case battleActions.finish:
				draw_text(xx, yy + 25 * m + 25, "Finish");
				break;
				
			case battleActions.flee:
				draw_text(xx, yy + 25 * m + 25, "Fleeing");
				break;
		}
		if (m >= 10) break;
	}
	xx += (string_width("Player 2")/2) + (string_width("Player 1")/2) + 65;
	if (n + 1 == 4) break;
}
try {
	var xx = 1100
	draw_text(xx, 350, "Player: " + string(playerSelecting + 1));
	draw_text(xx, 370, "HP: " + string(global.playerStats[playerSelecting][stats.HP]) + "/" + string(global.playerStats[playerSelecting][stats.maxHP]));
	draw_text(xx, 390, "MP: " + string(global.playerStats[playerSelecting][stats.MP]) + "/" + string(global.playerStats[playerSelecting][stats.maxMP]));
	xx += 150;
	draw_text(xx, 350, "Attack: " + string(global.playerStats[playerSelecting][stats.atk]));
	draw_text(xx, 370, "Defence: " + string(global.playerStats[playerSelecting][stats.def]));
	draw_text(xx, 390, "M. Attack: " + string(global.playerStats[playerSelecting][stats.mAtk]));
	draw_text(xx, 410, "M. Defence: " + string(global.playerStats[playerSelecting][stats.mDef]));
	xx += 150;
	draw_text(xx, 350, "Strength: " + string(global.playerStats[playerSelecting][stats.str]));
	draw_text(xx, 370, "Dexterity: " + string(global.playerStats[playerSelecting][stats.dex]));
	draw_text(xx, 390, "Toughness: " + string(global.playerStats[playerSelecting][stats.toughness]));
	draw_text(xx, 410, "Willpower: " + string(global.playerStats[playerSelecting][stats.will]));
}
catch (_exception) {
	show_debug_message(_exception.message);
	show_debug_message(_exception.longMessage);
	show_debug_message(_exception.stacktrace);
	show_debug_message(_exception.script);
}

#endregion