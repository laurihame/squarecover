function indeksit = nelionsisalla(nelio,points)
%%% palauttaa niiden pisteiden indeksit, jotka ovat nelion sisalla
indeksit = [];
[kork,lev] =size(points);
for i = 1:kork
	if onkosisalla(nelio,points(i,:))
		indeksit = [indeksit,i];
	end
end
