#region System Constants for Programmer reference

	enum stats {name, level, pos, eID, imageID, str, dex, will, toughness, maxHP, maxMP, maxSP, HP, MP, SP, atk, mAtk, def, mDef, spd, eva, acc, exhaustion, luck, xp, itemDrop, gold}
	enum battleActions {selecting, attack, defend, skills, item, finish, flee}
	enum actionInfo {actionID, target, lookup}
	enum battleActorID {p1, p2, p3, p4, e1, e2, e3, e4, e5, ties}
	
#endregion

#region Display Constants
	
#endregion

#region Battle System HUD Constants
	#macro battleHudX 0
	#macro battleHudY 380
	#macro battleHudWidth 1000
	#macro battleHudHeight 183

	#macro battleBoxBreakLineX battleHudWidth * 0.35

	#macro battleEnemyNamePosX battleHudX + sprite_get_width(spr_cursor3) + 5
	#macro battleEnemyNamePosY battleHudY + 5
	#macro battleEnemyNameSpacer 35

	#macro battlePlayerNamePosX battleHudWidth * 0.35 + 5
	#macro battlePlayerNamePosY battleHudY + 5
	#macro battlePlayerNameSpacer battleHudHeight/4.5
	
	#macro battlePlayerHealthTextPosX battlePlayerNamePosX + 50
	#macro battlePlayerHealthTextPosY battlePlayerNamePosY

	#macro battlePlayerHealthBarY battlePlayerNamePosY + 28
	#macro battlePlayerHealthBarX battlePlayerNamePosX
	#macro battlePlayerHealthBarWidth battlePlayerHealthBarX + 100
	#macro battlePlayerHealthBarHeight battlePlayerHealthBarY + 20

	#macro battleMenuWidth 1000
	#macro battleMenuHeight 530
	#macro battleMenuX 1000 * 0.85
	#macro battleMenuY battleMenuHeight - 200

	#macro battleDialogBoxX room_width * 0.05
	#macro battleDialogBoxY room_height * 0.50
	#macro battleDialogBoxWidth battleDialogBoxX + 1000
	#macro battleDialogBoxHeight battleDialogBoxY + 350

	#macro battleDialogTextScale 1
	#macro battleNameScale 1

	#macro battleMenuCursorPosX battleMenuX + 10

	#macro battleMenuTextPosX battleMenuWidth + (2*(battleMenuX - battleMenuWidth)/5)
	#macro battleMenuTextSpacer abs(battleMenuHeight - battleMenuY)/6
	#macro battleMenuTextPosY_base battleMenuY +  battleMenuTextSpacer/2
	#macro battleMenuTextScale 1
	
	#macro battleDialogTextPosX battleDialogBoxX + 10
	#macro battleDialogTextPosY battleDialogBoxY + 10
	
	#macro battleDialogCursorPosX battleDialogBoxWidth
	#macro battleDialogCursorPosY battleDialogBoxHeight
	
	#macro battleConfirmBoxX room_width * 0.65
	#macro battleConfirmBoxY room_height * 0.75
	#macro battleConfirmBoxWidth battleConfirmBoxX + 150
	#macro battleConfirmBoxHeight battleConfirmBoxY + 150
	#macro battleConfirmBoxSpacer 50
	
	#macro battleDebugMenuX 1000
	#macro battleDebugMenuY 0
	#macro battleDebugMenuWidth room_width - battleDebugMenuX
	#macro battleDebugMenuHeight room_height
	#macro battleDebugTextX 1250
	#macro battleDebugTextY 20
	#macro battleDebugTextSpacer 20
#endregion

#region Battle Sprite Locations

	#macro battlePlayerSeparator room_height

	#macro battlePlayerSprite1X room_width * 75/100
	#macro battlePlayerSprite1Y 50
	
	#macro battlePlayerSprite2X room_width * 80/100
	#macro battlePlayerSprite2Y 110
	
	#macro battlePlayerSprite3X room_width * 75/100
	#macro battlePlayerSprite3Y 170
	
	#macro battlePlayerSprite4X room_width * 80/100
	#macro battlePlayerSprite4Y 230
	
	#macro battleEnemySprite1X room_width * 25/100
	#macro battleEnemySprite1Y 50
	
	#macro battleEnemySprite2X room_width * 12/100
	#macro battleEnemySprite2Y 150

#endregion