doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
--doubleUs x y = x*2 + y*2

doubleSmallNumber x = if x > 100
    then x
    else x*2

part = [1,2,3]

parttwo = [4,5,6]

comb = part ++ parttwo


boomBangs xs = [ if x < 10 then "BOOM" else "BANG!" | x <- xs, odd x]