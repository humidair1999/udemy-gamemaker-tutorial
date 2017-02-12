///apply_friction(amount)

var amount = argument0;

// if player is moving
if (hspd != 0) {
    // if current moving speed (left or right) minus
    // the friction amount is greater than 0, apply
    // the friction to the moving speed
    if (abs(hspd) - amount > 0) {
        hspd -= amount * image_xscale;
    }
    // otherwise, just stop the character
    else {
        hspd = 0;
    }
}
