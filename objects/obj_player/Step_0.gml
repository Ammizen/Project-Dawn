keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyEnter = keyboard_check(vk_enter);

if global.movementEnabled {
	//Using binary operations to get the direction the player should be travelling.
	yDir = keyDown - keyUp;
	xDir = keyRight - keyLeft;

	//Checking if the player is moving diagonally
	if (ySpd != 0 and xSpd != 0) {
	
		//Using basic motion and vectors to figure out the speed the player would be walking at.
	
		// MATH:
		// X Component = Speed * cos( Angle )
		// Y Component = Speed * sin( Angle )
		ySpd = moveSpd * sin(degtorad(45));
		xSpd = moveSpd * cos(degtorad(45));
	}
	else {
		//Adjusting the speed the player is travelling.
		ySpd = moveSpd;
		xSpd = moveSpd;
	}

	//Setting the direction using the previously set variables
	ySpd = ySpd * yDir;
	xSpd = xSpd * xDir;

	//Updating the position with the speeds previously calculated.
	y = y + ySpd;
	x = x + xSpd;
	
	//Handling the pause menu
	if keyEnter {
		
	}
}