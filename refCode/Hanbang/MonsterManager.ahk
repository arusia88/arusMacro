Class ManageMonster {
    monsterArray := {}

    __New(attack) {
        ; MsgBox, "create managerMonster"
        this.attack := attack
    }

    add(monster){
        this.monsterArray.Insert(monster.name, monster)
    }

    do() {
        for index, monster in this.monsterArray
            if(monster.isExist() > 1){
                attack.do(monster.name, monster.resultArray)
            }
    }
}