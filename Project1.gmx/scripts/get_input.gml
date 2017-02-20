///get_input()

up = keyboard_check_pressed(vk_up);
up_released = keyboard_check_released(vk_up);
right = keyboard_check(vk_right);
down = keyboard_check(vk_down);
left = keyboard_check(vk_left);

var gp_id = 0;
var thresh = 0.5;

if (gamepad_is_connected(gp_id)) {
    up = gamepad_button_check_pressed(gp_id, gp_face1);
    up_released = gamepad_button_check_released(gp_id, gp_face1);
    right = gamepad_axis_value(gp_id, gp_axislh) > thresh;
    down = gamepad_axis_value(gp_id, gp_axislv) > thresh;
    left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
}
