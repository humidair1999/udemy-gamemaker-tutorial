///hurt_state()

sprite_index = spr_player_hurt;

if (hspd != 0) {
    image_xscale = sign(hspd);
}

if (!place_meeting(x, y + 1, Solid)) {
    vspd += grav;
}
else {
    vspd = 0;
    
    apply_friction(acc);
}

direction_move_bounce(Solid);

if (hspd == 0 && vspd == 0) {
    image_blend = c_white;
    
    if (PlayerStats.hp <= 0) {
        score = 0;
        
        PlayerStats.hp = PlayerStats.maxhp;
        
        room_restart();
    }
    
    state = move_state;
}
