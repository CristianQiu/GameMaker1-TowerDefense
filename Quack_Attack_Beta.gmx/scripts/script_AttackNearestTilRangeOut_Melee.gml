// Rotate the towers pointing to the nearest enemy if it is within the range and shoot towards the target if able

// If there isn't any enemy within the range set the target to noone
if (distance_to_object(obj_GroundEnemiesParent) > range){
    if (currentTarget != noone) currentTarget = noone;
    if (direction != 270) direction = 270;
    if (sprite_index != spriteIdle) sprite_index = spriteIdle;
}

// If there is an enemy within the range and we don't have target yet set the target to the nearest enemy
else if (distance_to_object(obj_GroundEnemiesParent) <= range && currentTarget == noone){
    currentTarget = instance_nearest(x, y, obj_GroundEnemiesParent);
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
            currentTarget.currentHp = currentTarget.currentHp - damage;
        }
        canShoot = 0;
    }
}

// canShoot stuff
if (fireRateCounter < fireRate && canShoot == 0) fireRateCounter += 1;
else if (fireRateCounter >= fireRate && canShoot == 0){
    fireRateCounter = 0;
    canShoot = 1;
}

image_angle = direction;