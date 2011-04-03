function [nelio,points] = tarkistajaeliminoi(indeksi,points,suunta)
%%%%% tarkistaa indeksiä vastaavan pisteen ympäristön ja eliminoi, mikäli mahdollista.
%%%%% palauttaa asetetun nelion ja uuden pistejoukon 
nelio=[];
piste = points(indeksi,:);
%%%% poistetaan peruspiste joukosta
%%% indeksit = [1:indeksi-1,indeksi+1:length(points)];

[kork,lev] = size(points);

tarkistus = zeros(1,4);

%%%%oikea ylänurkka
tarkistus(1) = onkotyhja(piste,points);

%%%% oikea alanurkka
tarkistus(2) = onkotyhja([piste(1),piste(2)-1],points);

%%%% vasen alanurkka
tarkistus(3) = onkotyhja(piste -1,points);

%%%% vasen ylänurkka
tarkistus(4) = onkotyhja([piste(1)-1,piste(2)],points);

summa = sum(tarkistus);
%%%% tarkistetaan summa
if  summa < 3
    %%%% ei onnistu
    return;
elseif summa == 4 %%%% jos kaikki ovat tyhjia
    %%%%% asetetaan nelio oikeaan ylanurkkaan 
    nelio = piste;
    %%%%% poistetaan peruspiste
    points = points([1:indeksi-1,indeksi+1:kork],:);
    %%%%% eliminoidaan..
    points = eliminoi(nelio,points);
    return;
end
%%%% ok, tassa vaiheessa tasmalleen kolme nelioista on tyhjia
%%%%% poistetaan peruspiste
points = points([1:indeksi-1,indeksi+1:kork],:);

%%%% mika on taysi?
taysi = find(1-tarkistus);
taysi = taysi(1);
if taysi == 1 %%%% oikea ylanurkka
    nelio = piste;
    %%%%% eliminoidaan..
    points = eliminoi(nelio,points);
    return;
elseif taysi==2 %%%% oikea alanurkka
    nelio = [piste(1),piste(2)-1];
    %%%%% eliminoidaan..
    points = eliminoi(nelio,points);
elseif taysi == 3 %%%% vasen alanurkka
    nelio = piste -1;
    %%%%% eliminoidaan..
    points = eliminoi(nelio,points);
else  %%%% vasen ylänurkka
    nelio = [piste(1)-1,piste(2)];
    %%%%% eliminoidaan..
    points = eliminoi(nelio,points);
end
