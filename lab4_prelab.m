f = @(x) [2.*sin(x)-(x.^2)./30];

fplot(f, [-6, 9]);


Global_Max = fzero (f,-6)
Global_Min = fzero (f,6)

loc_min = fzero (f,-2)
loc_max1 = fzero (f,2)
loc_max2 = fzero (f,8)