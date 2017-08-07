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
        for index, monster in this.monsterArray {
            cnt:=monster.isExist()
            if(cnt >= 1){
                this.attack.do(monster, cnt)
            }
        }
    }
}