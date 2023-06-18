# two possible values for user -> 0 = o or 1 = x
# 0 & 1 should be equal no. of times
# choice will be given to user to pick value between 0 & 1 in 1st entry, then that will become valid for user other one invalid
# location should be asked to user before putting user's value
# one for user other should be choosen by computer
# ask user to input until correct value

print("######## WELCOME TO THE TIC TAC TOE GAME ##########")

xstate = [0,0,0,0,0,0,0,0,0]
ystate = [0,0,0,0,0,0,0,0,0]
chance = 1
i = 0

def printboard(xstate,ystate):
    zero = 'X' if xstate[0] == 1 else ( 'O' if ystate[0] == 1 else 0)
    one = 'X' if xstate[1] == 1 else ( 'O' if ystate[1] == 1 else 1)
    two = 'X' if xstate[2] == 1 else ( 'O' if ystate[2] == 1 else 2)
    three = 'X' if xstate[3] == 1 else ( 'O' if ystate[3] == 1 else 3)
    four = 'X' if xstate[4] == 1 else ( 'O' if ystate[4] == 1 else 4)
    five = 'X' if xstate[5] == 1 else ( 'O' if ystate[5] == 1 else 5)
    six = 'X' if xstate[6] == 1 else ( 'O' if ystate[6] == 1 else 6)
    seven = 'X' if xstate[7] == 1 else ( 'O' if ystate[7] == 1 else 7)
    eight = 'X' if xstate[8] == 1 else ( 'O' if ystate[8] == 1 else 8)
    print("\n")
    print(f"{zero} | {one} | {two}")
    print(f"--|---|--")
    print(f"{three} | {four} | {five}")
    print(f"--|---|--")
    print(f"{six} | {seven} | {eight}")
    print("\n")

win = [[0,3,6],[0,1,2],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]

def check(xstate,ystate):
    sum1=0
    for x in win:
        if xstate[x[0]]+xstate[x[1]]+xstate[x[2]] == 3:
           print("\n**********************")
           print("Player 1 is the winner")
           print("**********************")
           return 0
        
    for x in win:
        if ystate[x[0]]+ystate[x[1]]+ystate[x[2]] == 3:
           print("\n**********************")
           print("Player 2 is the winner")
           print("**********************")
           return 0
    
    return -1
    
while(i <= 9):
    printboard(xstate,ystate)

    if i == 9: 
        print("GAME OVER")
        break

    if chance:
        while(True):
            x = int(input("Player 1's chance:"))
            if (xstate[x] == 0 and ystate[x] == 0): 
                xstate[x] = 1
                break
            else: print("Incorrect value")

    else:
        while(True):
            y = int(input("Player 2's chance:"))
            if (xstate[y] == 0 and ystate[y] == 0): 
                ystate[y] = 1
                break
            else: print("Incorrect value")

    result = check(xstate,ystate)

    if result != -1:
        printboard(xstate,ystate) 
        print("GAME DONE")
        break

    chance = not chance
    i = i+1