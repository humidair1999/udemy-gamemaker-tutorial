/// Control the player

// How to call an external script located in scripts/
// control_player();

var up = keyboard_check(vk_up);
var up_released = keyboard_check_released(vk_up);
var right = keyboard_check(vk_right);
var down = keyboard_check(vk_down);
var left = keyboard_check(vk_left);

if (!place_meeting(x, y + 1, Solid)) {
    vspd += grav;
    
    // player has pressed (and released) the up key and
    // is still traveling up; "dampening" the jump mid-air
    if (up_released && vspd < -6) {
        vspd = -6;
    }
}
else {
    if (up) {
        vspd = -16;
    }
    else {
        vspd = 0;
    }
}

if (right) {
    hspd = spd;
}

if (left) {
    hspd = -spd;
}

if (hspd != 0) {
 image_xscale = sign(hspd);
}

if (!right && !left) {
    hspd = 0;
}

move(Solid);

// ledge grab logic

var falling = y - yprevious > 0;
var wasnt_wall = !position_meeting(x + 17 * image_xscale, yprevious, Solid);
var is_wall = position_meeting(x + 17 * image_xscale, y, Solid);

if (falling && wasnt_wall && is_wall) {
    hspd = 0;
    vspd = 0;
    
    // while there's a wall CLOSE but still not touching, gradually slide
    // the player closer and closer on the x axis
    while (!place_meeting(x + image_xscale, y, Solid)) {
        x += image_xscale;
    }
    
    // while there's a wall touching the side of the player and even with
    // (or more than) half the height of the player, slide the player up to the
    // corner of the ledge
    while (position_meeting(x + 17 * image_xscale, y - 1, Solid)) {
        y -= 1;
    }
    
    state = ledge_grab_state;
}

