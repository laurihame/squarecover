function points = eliminoi(nelio,points)
%% poistaa pistejoukosta nelion sisalla olevat 
[kork,lev] = size(points);
indeksit = nelionsisalla(nelio,points);
indeksit = setdiff(1:kork,indeksit);
points = points(indeksit,:); 
