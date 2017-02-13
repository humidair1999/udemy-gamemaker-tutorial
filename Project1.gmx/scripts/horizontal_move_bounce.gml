///horizontal_move_bounce(collision_object)

var collision_object = argument0;

// if player is approaching Solid on the x axis
if (place_meeting(x + hspd, y, collision_object)) {
    // while collision has not occurred on immediate next pixel
    while (!place_meeting(x + sign(hspd), y, collision_object)) {
        // drastically slow player to 1px/step
        x += sign(hspd);
    }

    hspd = -(hspd / 2);
}

x += hspd;

if (place_meeting(x, y + vspd, collision_object)) {
    while (!place_meeting(x, y + sign(vspd), collision_object)) {
        y += sign(vspd);
    }

    vspd = 0;
}

y += vspd;

