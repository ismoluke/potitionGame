-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

maxX = 240 -- screen X - cos
maxY = 136 -- screen Y - sin

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

cls()

function TIC()
            cls()
            pushBall(weight)
            coordBall()
            slowDown(weight)
            spr (48,tx,ty)
            drawDataBar() --debug bar
end

function drawDataBar()
    print (spStart, 1, 1, grey)
    print (weight, 16, 1, grey)
   print (sp, 1,10, white)
   print (cornerValue, 1, 16, grey)
   print (tx, 1, 22, white)
   print (ty, 1, 28, white)
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
            else
                sp=spStart-weight
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


    if spStart < spMax/3 -- Рисуем цвет в зависимости от величины до 33%зеленый, до 66%желтый, дальше красный
        then
            lineColor=lightGreen
        else
            if (spStart<=2*spMax/3 and spStart>=spMax/3)
                then
                    lineColor=yellow
                else
                    lineColor=red
            end
    end

    if sp==0 -- Рисуем стрелку, только если шар стоит
        then
            line (tx+4, ty+4, tx+spStart*modX*3, ty+spStart*modY*3, lineColor)
        else
    end
end

function canIWalk()
--Определяем координаты квадрата тайла, потом мы их подвигаем, что бы понять, можем ли мы двигаться, или нет.
    local x1 = 1
    local x2 = 1
    local y1 = 1
    local y2 = 1
--Забираем инфу о тайлах нужных нам с помощью, а дальше определяем изменение модификатора
    p1 = tileNumber (x1,y1)
    p2 = tileNumber (x1,y2)
    p3 = tileNumber (x2,y1)
    p4 = tileNumber (x2,y2)
--По кругу проверяем тайл на данных значениях
     

end

function tileInfo (x) --Смотрим тип тайла на оторый перемещается точка
    if (x>=hardMin and x<=hardMax)
        then
        return false
    end
end