///exit_state()

if (image_alpha > 0) {
    image_alpha -= 0.25;
}
else {
    if (room != room_last) {
        room_goto_next();
    }
    else {
        score = PlayerStats.sapphires;
        
        ini_open("highscores.ini");
        
        PlayerStats.highscore = ini_read_real("Score", "Highscore", 0);
        
        if (score > PlayerStats.highscore) {
            PlayerStats.highscore = score;
            
            ini_write_real("Score", "Highscore", PlayerStats.highscore);
        }
        
        ini_close();
        
        room_goto(rm_highscore);
    }
}
