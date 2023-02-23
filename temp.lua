-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

tab1 = {{1, 2, 3}, {3, 2, 1}}
tab2 = {{0, 1, 2}, {2, 1, 0}}

function TIC()
            cls()
            test2(test1(tab1, tab2))
end

function test1(pr1, pr2)
	conc1 = {pr1[1], pr2[1], pr1[2]}
	print (conc1[1][1], 1, 1)
	return conc1
end

function test2(conc)

	summP = {0, 0, 0}
	for j=1, 3 do
		for i=1, #conc do
			summP[j] = summP[j]+conc[i][j]
		end
	end
	print(summP[1]..'       '..summP[2]..'     '..summP[3], 1, 60, 5)
end