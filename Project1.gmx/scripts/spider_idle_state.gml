//spider_idle_state()

if (instance_exists(Player)) {
    var dis = distance_to_object(Player);
    
    if (dis < sight && alarm[0] <= 0) {
        // animation end event fired when this pre-jump
        // animation completes
        image_speed = 0.5;
        
        if (Player.x != x) {
            image_xscale = sign(Player.x - x);
        }
    }
}
