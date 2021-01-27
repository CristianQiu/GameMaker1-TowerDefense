// Draw the range as a transparent circle, draw a glowing effect as another circle and the tower object itself
if (selectedTower == 1 && obj_GameManager.draggingTower == 0){
    draw_set_blend_mode(bm_add);
    draw_set_colour(c_black);
    draw_circle_color(x, y, sprite_height - (sprite_height/4), c_white, c_black, 0);
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(0.2);
    draw_circle(x, y, range + rangeDrawAdjust, false);  
}
draw_set_alpha(1);
draw_self();
