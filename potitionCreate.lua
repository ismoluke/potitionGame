-- title:   PotitionGame. potitionCreatePart
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

function TIC()
    drawDataBar() --debug bar
end

function qualityPotition (r,g,b)
	if g<>0
		then
			if (r<>0 and b<>0)
				then
					i=g//2
					y=i
					c=i
					g=g-i*2
					r=r-y
					b=b-c
				else
					if (r<>0)
						then
							i=math.min(r,g)
							y=i
							c=0
							g=g-i
							r=r-i
							b=0
						else
					end
			end
		else
			--дописать финальное приравнивание
	end
end

function testCreatePotition()
-- Сюда допишем тесты, пока я не знаю, что на выходе допишу комментами
	qualityPotition(5, 3, 4) -- 41113
	qualityPotition(5, 0, 4) -- 50004
 	qualityPotition(5, 3, 0) -- 23000
	qualityPotition(5, 0, 0) -- 50000
	qualityPotition(0, 1, 3) -- 00012
	qualityPotition(0, 1, 0) -- 00100
end

function drawDataBar()
--Начальные значение
	print (r, 1, 1, red)
	print (y, 6, 6, yellow)
	print (g, 11, 1, green)
	print (c, 16, 6, cyan)
	print (b, 21, 1, blue)
--Конечные значения
	print ()
	print ()
	print ()
	print ()
	print ()

end