if (poisoned == 0){
    colourHealth = c_blue;
}
else if (poisoned == 1){
    colourHealth = c_purple;
}

draw_healthbar(x - sprite_width/2, y + (1.3 * sprite_height/2), x + sprite_width/2, (y + (1.3 * sprite_height/2)) + 4, (currentHp / maxHp) * 100, c_black, c_white, colourHealth, 0, true, true);
draw_self();