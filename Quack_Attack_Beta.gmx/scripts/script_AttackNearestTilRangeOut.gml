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
            // Create the bullet
            // Spawn bullets in each pistol with the obj_DoublePistol or in both pistols is it is upgraded
            if (thisTowerProjectile == obj_BulletProjectile){
                if (upgrade == 0){
                    if (bulletCounter == 1){
                        tipAngle = 30;
                        bulletCounter = 0;
                    }
                    else if (bulletCounter == 0){
                        tipAngle = 330;
                        bulletCounter = 1;
                    }
                }
                else if (upgrade == 1){
                    if (loopOnce == 0){
                        damage += upgradeDmg;
                        tipAngle = 30;
                        loopOnce = 1;
                    }
                    newProjectile2 = instance_create(x + lengthdir_x(distanceToTip, 330 + direction), y + lengthdir_y(distanceToTip, 330 + direction), thisTowerProjectile);
                    with (newProjectile2)
                    {
                        direction = other.direction;
                        image_angle = direction;
                        speed = other.projectileSpeed;
                    }
                }          
            }
            // distanceToTip Length of the vector from the center of the sprite to the tip of the weapon
            // tipAngle Angle in which the weapon is placed in the sprite, remember that 0 means the sprite points to the right
            newProjectile = instance_create(x + lengthdir_x(distanceToTip, tipAngle + direction), y + lengthdir_y(distanceToTip, tipAngle + direction), thisTowerProjectile);
            with (newProjectile)
            {
                direction = other.direction;
                image_angle = direction;
                speed = other.projectileSpeed;
            }
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