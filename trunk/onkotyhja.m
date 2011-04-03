function u = onkotyhja(nelio,points)
%%% onko nelio tyhja
indeksit = [];
u=1;
[kork,lev]=size(points);
for i = 1:kork
	if onkosisalla(nelio,points(i,:))
		u=0;		
		return; 	
	end
end
