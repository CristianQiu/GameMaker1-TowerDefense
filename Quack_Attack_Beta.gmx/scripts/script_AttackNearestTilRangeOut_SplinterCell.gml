// Rotate the towers pointing to the nearest enemy if it is within the range and shoot towards the target if able

// If there isn't any enemy within the range set the target to noone
if (distance_to_object(obj_EnemiesParent) > range){
    if (currentTarget != noone) currentTarget = noone;
    if (direction != 270) direction = 270;
    if (sprite_index != spriteIdle) sprite_index = spriteIdle;
}

// If there is an enemy within the range and we don't have target yet set the target to the nearest enemy
else if (distance_to_object(obj_EnemiesParent) <= range && currentTarget == noone){
    currentTarget = instance_nearest(x, y, obj_EnemiesParent);
}
    
// Keep the target selected above until it goes out of range
if (currentTarget != noone){
    if (distance_to_object(currentTarget) > range){
        currentTarget = noone;
    }
    
    else if (distance_to_object(currentTarget) <= range){
        direction = point_direction(x, y, currentTarget.x, currentTarget.y);
        if (canShoot == 1){
            if (sprite_index != spriteAttack) sprite_index = spriteAttack;    
        }
    }
}

// canShoot stuff
if (upgrade == 0){
    if (!instance_exists(newProjectile)) canShoot = 1;
    else if (instance_exists(newProjectile)){
        canShoot = 0;
    }
}
else if (upgrade == 1) canShoot = 1;

image_angle = direction;