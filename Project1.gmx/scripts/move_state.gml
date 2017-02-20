///move_state()

// How to call an external script located in scripts/
// control_player();

if (!place_meeting(x, y + 1, Solid)) {
    vspd += grav;
    
    sprite_index = spr_player_jump;
    image_speed = 0;
    
    if (vspd > 0) {
        image_index = 1;
    }
    else {
        image_index = 0;
    }
    
    // player has pressed (and released) the up key and
    // is still traveling up; "dampening" the jump mid-air
    if (up_released && vspd < -6) {
        vspd = -6;
    }
}
else {
    if (hspd == 0) {
        sprite_index = spr_player_idle;
    }
    else {
        sprite_index = spr_player_walk;
        image_speed = 0.6;
    }

    if (up) {
        vspd = -16;
        
        audio_play_sound(snd_jump, 5, false);
    }
    else {
        vspd = 0;
    }
}

if (right || left) {
    hspd += (right - left) * acc;
    // hspd_dir = right - left;
    
    if (hspd > spd) {
        hspd = spd;
    }
    else if (hspd < -spd) {
        hspd = -spd;
    }
}
else {
    //hspd = 0;
    apply_friction(acc);
}

if (hspd != 0) {
 image_xscale = sign(hspd);
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
    
    sprite_index = spr_player_ledge_grab;
    state = ledge_grab_state;
}

