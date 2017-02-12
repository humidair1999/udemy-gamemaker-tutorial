///spider_jump_state()

image_index = image_number - 1;

// note that this state represents the spider as it's
// midair
if (!place_meeting(x, y + 1, Solid)) {
    vspd += grav;
}
else {
    vspd = 0;
    
    apply_friction(acc);
    
    if (hspd == 0 && vspd == 0) {
        state = spider_idle_state;
        
        image_index = 0;
        image_speed = 0;
        alarm[0] = 15;
    }
}

if (hspd != 0) {
    image_xscale = sign(hspd);
}

horizontal_move_bounce(Solid);
