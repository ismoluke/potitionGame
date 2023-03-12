-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

maxX = 240 -- screen X - cos
maxY = 136 -- screen Y - sin

devOption=
{
    --рисовать или нет дебаг бар
    debag = 1
}

--inventory list

inv=
{
    A=0,
    B=0,
    C=3
}

--game status

game=
{   
    state = 0,
    faze = 1
}

--initialization color
black=0
purple=1
red=2
orange=3
yellow=4
lightGreen=5
green=6
darkGreen=7
darkBlue=8
blue=9
lightBlue=10
cyan=11
white=12
lightGrey=13
grey=15
darkGrey=15

--initialization tile
hardMin=0
hardMax=47


cornerValue = 270

tx=maxX/2-4
ty=maxX/2-4

spMax=9
spStart=0
sp=0
weight=5

x=10
y=10

modX=1*math.cos(math.rad(cornerValue))
modY=1*math.sin(math.rad(cornerValue))

frameSumm=0
debag = 0
cls()

function TIC()
            cls()
            --тест рисуем карту, тут пока описываем работу сбора ресурсов
            --разобьем игру на фазы, 1 - выбор шара, его запуск, 2 - оставим для катания, 3 - сбор ресов и цикл дальше
            map (0,0,30,17)
            if game.faze == 1 then
                pushBall(weight)
            end
            coordBall()
            if game.faze == 2 then
                slowDown(weight)
            end
            spr (48,tx,ty)
            if game.faze == 3 then
                dropPlants (tx, ty)
            end
            if game.debag = 1 then
                drawDataBar() --debug bar
            end
end

function drawDataBar()
    print (spStart, 1, 1, grey)
    print (weight, 16, 1, grey)
   print (sp, 1,10, white)
   print (cornerValue, 1, 16, grey)
   print (tx, 1, 22, white)
   print (ty, 1, 28, white)
   NX=mget (tx//8,ty//8)
   print ("A="..inv.A .." B="..inv.B .." C="..inv.C.."   "..NX..game.faze, 50, 1, white)
   print ("debug  "..debag, 155, 1, red)
end

function coordBall()
        tx=tx+sp*modX
        ty=ty+sp*modY
        if ( tx<1 or tx>232)
            then modX=modX*-1
        end
        if ( ty<1 or ty>128)
            then modY=modY*-1
        end
end

function slowDown(weight)

--Делаем замедление в зависимости от веса шара

g=weight

if frameSumm==60
    then
    if (sp-g)>0
        then
            sp=sp-g
        else
            sp=0
            game.faze = 3 --Остановились, а значит можно собрать траву
    end
    else
end
    if (frameSumm<60)
        then
            frameSumm=frameSumm+1
        else
            frameSumm=0
    end
end

function pushBall(weight)

    local lineColor = white
    local deltaSpeed = 1
    local deltaCorner = 5

    if btn(0)
        then
            if (spStart+deltaCorner)<=spMax
                then
                    spStart=spStart+deltaSpeed
                else
                    spStart=spMax
            end
    end

    if btn(1)
        then
            if (spStart-deltaSpeed)>0
                then
                    spStart = spStart - deltaSpeed -- down start push's power
                else
                    spStart = 1
            end
    end

    if btn(4)
        then
        --Толкаем шар, но замедляем его на вес шара, что бы ощущать вес
        if (spStart-weight) <=1
            then
                sp=1
                game.faze = 2 --толкнули шар, а значит переходим на следующую фазу
            else
                sp=spStart-weight
                game.faze = 2 --толкнули шар, а значит переходим на следующую фазу
                
        end

        

    end

    if btn(2) -- button left
        then
            cornerValue=cornerValue-deltaCorner
            modX=1*math.cos(math.rad(cornerValue))
            modY=1*math.sin(math.rad(cornerValue))
        end
    if btn(3) -- button right
        then
            cornerValue=cornerValue+deltaCorner
            modX=1*math.cos(math.rad(cornerValue))
            modY=1*math.sin(math.rad(cornerValue))
        end
    -- paint way line

-- Рисуем цвет в зависимости от величины до 33%зеленый, до 66%желтый, дальше красный
    if spStart < spMax/3 then 
            lineColor=lightGreen
        elseif (spStart<=2*spMax/3 and spStart>=spMax/3) then
            lineColor=yellow
        else
            lineColor=red
    end

    if game.faze==1 -- Рисуем стрелку, только в первой фазе
        then
            line (tx+4, ty+4, tx+8+spStart*modX*3, ty+8+spStart*modY*3, lineColor)
        else
    end
    
    function dropPlants(xBall,yBall)
--Собираем травку в зависимости от того, какие тайлы задевает шар, но только в третьей фазе
        --if game.faze == 3 then

            dropPlant (xBall, yBall)
            dropPlant (xBall+8, yBall)
            dropPlant (xBall, yBall+8)
            dropPlant (xBall+8, yBall+8)

            game.faze = 1

        --end
    end

    function dropPlant (xBall, yBall)

       local tilePlant  = mget (xBall//8, yBall//8)

        if tilePlant == 246 then 
            inv.A = inv.A + 1
            debag = 1 --ебать длебаг
        elseif tilePlant == 247 then 
            inv.B = inv.B + 1
            debag = 1 --ебать длебаг
        elseif tilePlant == 248 then 
            inv.C = inv.C + 1
            debag = 1 --ебать длебаг
        end
    end
end