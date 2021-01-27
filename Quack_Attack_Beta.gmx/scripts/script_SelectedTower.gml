// To prevent to select a tower if it is placed behind the upgrade + sell bar (top right)
if (!place_meeting(mouse_x, mouse_y, obj_ButtonParent)){
    newClickedTowerId = instance_position(mouse_x, mouse_y, obj_TowersParent);
    
    // If the new clicked tower is the same as the clicked before and is not selected yet then we select it
    // || If the new clicked tower is different from the clicked before we deselect any previous tower and select the new one
    if (newClickedTowerId == oldClickedTowerId && newClickedTowerId.selectedTower == 0 
    || newClickedTowerId != oldClickedTowerId){
        with(obj_TowersParent){
            selectedTower = 0;
        }
        newClickedTowerId.selectedTower = 1;
    }
    
    // If the new clicked tower is the same as the clicked before and is selected already then we unselect it
    else if (newClickedTowerId == oldClickedTowerId && newClickedTowerId.selectedTower == 1){
            newClickedTowerId.selectedTower = 0;
    }
    
    oldClickedTowerId = newClickedTowerId;
}