function neliot=exactsquarecover(n)
global ratkaisut
ratkaisut={};

%%%%% versio 2: tehd‰‰n nurkkaeliminaatio kaikille pisteille kaikkiin
%%%%% suuntiin

%rand ("seed", 0);
%%% mihin neliot tulevat (muotoa [vasen alanurkka])
more off;
neliot = [];
clf
points=10*rand(n,2);
points2=points;

%%%% 1. ratkaisu saadaan nurkka-eliminaatiolla
niter = n*5;
indeksi= 1; %%%% aloitetaan ensimmaisesta pisteesta
for iter = 1:niter
    [kork,lev] = size(points2);
    if kork < 1
        break;
    end
    indeksi = ceil(rand*kork);
    clf;
    hold on;
    [nelio,points2] = tarkistajaeliminoi(indeksi,points2);
    if ~isempty(nelio)
        neliot = [neliot; nelio];
        plot(points(:,1),points(:,2),'+');
        axis([-1 11 -1 11]);
        [kork2,lev] = size(neliot);
        for k = 1:kork2;
            piirranelio(neliot(k,:));
        end
        drawnow;
        indeksi = 1;
        %kbhit();
    else %%%%% jos ei voida eliminoida, siirrytaan seuraavaan indeksiin
        indeksi = indeksi + 1;
    end
end

%disp('Nurkkapisteiden lkm:');
%disp(size(neliot,1));

%disp('Peitettyjen lkm');
%disp(n-size(points2,1));

%disp('Arvio (nurkkien lkm):');
%lkm1 =n*(4*exp(-3*(n/100))*(1-exp(-(n/100))) + exp(-4*(n/100)));
%disp(lkm1);

%disp('Arvio (peitettyjen lkm):');
%disp((n/100 + 1) * lkm1);

%kork
%size(points2)
if kork > 0 
    tokavaihe(points2,neliot);
    minimi = inf;
    for kk = 1:length(ratkaisut)
        [testi,kakkonen] = size(ratkaisut{kk});	
        if testi < minimi
            parasindeksi = kk;
        end
    end
    neliot = ratkaisut{parasindeksi};
end

clf;
hold on;
plot(points(:,1),points(:,2),'+');
axis([-1 11 -1 11]);
[kork2,lev] = size(neliot);
for k = 1:kork2;
    piirranelio(neliot(k,:));
end

hold off;
[sdf,asd] = size(neliot);
disp('Nelioiden lkm:'); 
disp(sdf);


