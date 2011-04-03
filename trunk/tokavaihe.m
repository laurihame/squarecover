function u = tokavaihe(points,neliot)
global ratkaisut


%%%% tarkistetaan onko jäljellä
[kork,lev] =size(points);
if kork < 1
    %%%% löytyi uusi ratkaisu
    ratkaisut{end+1} = neliot;
    return;
end


%%%% etsitään alin piste
[y,indeksi] = min(points(:,2)); 

alin = points(indeksi,:);

%%%% poistetaan se pisteistä
points = points([1:indeksi-1,indeksi+1:end],:);

%%%% jos pisteitä ei ole jäljellä
if isempty(points)
    %%% peitetään alin neliöllä
    nelio = alin;
    neliot = [neliot; nelio];
    ratkaisut{end+1} = neliot;
    return;
end



%%%%% alimman pisteen yläpuolella olevat pisteet
%%%%% vasen ylänurkka ja oikea ylänurkka
vasenylajoukko = nelionsisalla([alin(1)-1,alin(2)],points);
oikeaylajoukko = nelionsisalla(alin,points);


%%%% onko oikea ylakulma tyhja
if isempty(oikeaylajoukko)
    %%%%% asetetaan uusi neliö
    nelio = [alin(1)-1,alin(2)];
    neliot2 = [neliot; nelio];
    points2 = eliminoi(nelio,points);
    tokavaihe(points2,neliot2);
    return;
else
    peitettavat = points(oikeaylajoukko,:);
end

%%%% onko vasen ylakulma tyhja
if isempty(vasenylajoukko)
    %%%%% asetetaan uusi neliö
    nelio = alin;
    neliot2 = [neliot; nelio];
    points2 = eliminoi(nelio,points);
    tokavaihe(points2,neliot2);
    return;
end

%%%%% ok, tassa vaiheessa pisteita on seka vasemmalla etta oikealla

%%%% vasemmalla olevien pisteiden määräämät tasot
tasot = points(vasenylajoukko,:);
[tasot,ii] = sort(tasot(:,1));

%%%% poistetaan ensimmäistä tasoa vastaava piste pointsista
poistettavaindeksi = vasenylajoukko(ii(1));
points2 = points([1:poistettavaindeksi-1,poistettavaindeksi+1:end],:);

%%%%% asetetaan uusi neliö
nelio = [tasot(1),alin(2)];

neliot2 = [neliot; nelio];
points2 = eliminoi(nelio,points2);
tokavaihe(points2,neliot2);


%%%% oikealla olevien pisteiden määräämät tasot
tasot2 = points(oikeaylajoukko,:);
%%%% tarkastellaan x-koordinaatteja
tasot2 = tasot2(:,1);
tasot2=tasot2-1;
%%%% poistetaan ne jotka ovat vasemmanpuolimmaisimman pisteen vasemmalla
%%%% puolella
tasot2=tasot2(find(tasot2 > tasot(1)));
[tasot2,ii] = sort(tasot2);


jj = 1;
while  jj <=length(tasot2)
    
    %%%% poistetaan tasoa vastaava piste pointsista
    poistettavaindeksi = oikeaylajoukko(ii(jj));
    points2 = points([1:poistettavaindeksi-1,poistettavaindeksi+1:end],:);
    
    %%%%% asetetaan uusi neliö
    nelio = [tasot2(jj),alin(2)];
    
    neliot2 = [neliot; nelio];
    points2 = eliminoi(nelio,points2);
    tokavaihe(points2,neliot2);
    jj=jj+1;
end



