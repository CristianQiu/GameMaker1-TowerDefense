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
            // Save the x and y position where the bomb explodes and create an explosion effect when it collides with an enemy
            //if (currentTarget != noone){
                xExploded = currentTarget.x;
                yExploded = currentTarget.y;
                effect_create_above(ef_explosion, xExploded, yExploded, 0.2, c_red);
                
                // Calculate the damage received by the enemies according to the distance from the enemy to the explosion (actually bomb)
                with (obj_EnemiesParent){
                        howCloseToExplosion = point_distance(x, y, other.xExploded, other.yExploded);
                        damageFactor = other.areaOfEffect - howCloseToExplosion;
                        // Substract the maxDamage * (0.0XX... (to) 0.9XX...) from the current hp of the enemy 
                        if (damageFactor > 0){
                            currentHp = currentHp - (other.maxDamage * (damageFactor/other.areaOfEffect));
                        }
                        // Substract the maxDamage from the current hp of the enemy
                        else if (damageFactor == 0){
                            //if (instance_exists(other.currentTarget)){
                                currentHp = currentHp - other.maxDamage;
                            //}
                        }
                }
            //}
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