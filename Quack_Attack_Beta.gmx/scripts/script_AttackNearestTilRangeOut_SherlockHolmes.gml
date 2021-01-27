// Rotate the towers pointing to the nearest enemy if it is within the range and shoot towards the target if able

// If there isn't any enemy within the range set the target to noone
if (distance_to_object(obj_EnemiesParent) > range){
    if (currentTarget != noone) currentTarget = noone;
    if (direction != 270) direction = 270;
    if (sprite_index != spriteIdle) sprite_index = spriteIdle;
    if (instance_exists(newProjectile)){
        with (newProjectile)
        {
            instance_destroy();
        }
        canShoot = 1;
    }
}

// If there is an enemy within the range and we don't have target yet set the target to the nearest enemy
else if (distance_to_object(obj_EnemiesParent) <= range && currentTarget == noone){
    if (instance_exists(newProjectile)){
        with (newProjectile)
        {
            instance_destroy();
        }
        canShoot = 1;
    }
    currentTarget = instance_nearest(x, y, obj_EnemiesParent);
}

// Keep the target selected above until it goes out of range
if (currentTarget != noone){
    if (distance_to_object(currentTarget) > range){
        currentTarget = noone;
        if (instance_exists(newProjectile)){
            with (newProjectile)
            {
                instance_destroy();
            }
            canShoot = 1;
        }
    }

// When the target is within the range make the tower point to it, manage the sprite and if the tower does not have a projectile created yet it creates a new one over the target
// The projectile Beam will subtract life from the current target each step. Also the projectile will point to the tower which created it just in case I wanted to create my own
// beam instead of using the function draw_line_colour in the draw event    
    else if (distance_to_object(currentTarget) <= range){
        direction = point_direction(x, y, currentTarget.x, currentTarget.y);
        if (sprite_index != spriteAttack) sprite_index = spriteAttack;
            if (canShoot == 1){
                newProjectile = instance_create(currentTarget.x, currentTarget.y, thisTowerProjectile);
            }
            canShoot = 0;
            with (newProjectile)
            {   
                x = other.currentTarget.x;
                y = other.currentTarget.y;
                direction = point_direction(x, y, other.x, other.y);;
                image_angle = direction;
            }
    }
}

image_angle = direction;