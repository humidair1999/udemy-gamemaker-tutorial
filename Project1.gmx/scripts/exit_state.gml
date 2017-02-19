///exit_state()

if (image_alpha > 0) {
    image_alpha -= 0.25;
}
else {
    if (room != room_last) {
        room_goto_next();
    }
    else {
        game_restart();
    }
}
