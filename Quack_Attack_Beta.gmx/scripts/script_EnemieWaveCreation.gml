iniX = path_get_x(path_1, 0);
iniY = path_get_y(path_1, 0);
enemySeparation += 1;

// This code is highly linked to the code in obj_Wave1 creation 
if (obj_WavesManager.currentWave % 2 == 1){
    if (enemyCounter < (enemiesToSpawn/2) && enemySeparation % 30 == 0){
        newEnemy = instance_create(iniX, iniY, enemyType1);
        with (newEnemy){
            path_start(path_1, pathSpeed, 0, false);
        }
        enemyCounter += 1;
    }
    else if (enemyCounter >= (enemiesToSpawn/2) && enemyCounter < enemiesToSpawn && enemySeparation % 30 == 0){
        newEnemy = instance_create(iniX, iniY, enemyType2);
        with (newEnemy){
            path_start(path_1, pathSpeed, 0, false);
        }
        enemyCounter += 1;
    }
}

else if (obj_WavesManager.currentWave % 2 == 0){
    if (enemyCounter < enemiesToSpawn && enemySeparation % 30 == 0){
        newEnemy = instance_create(iniX, iniY, enemyType);
        with (newEnemy){
            path_start(path_1, pathSpeed, 0, false);
        }
        enemyCounter += 1;
    }
}

if (enemyCounter == enemiesToSpawn){
    if (!instance_exists(obj_EnemiesParent) && !waveMoneyAdded){
        obj_WavesManager.increaseMoneyAfterWaveCountdown += 1;
        if (obj_WavesManager.increaseMoneyAfterWaveCountdown >= 60){
            obj_Money.currentMoney += (obj_WavesManager.currentWave * 5);
            obj_WavesManager.increaseMoneyAfterWaveCountdown = 0;
            waveMoneyAdded = true;
        }
    }    
}
