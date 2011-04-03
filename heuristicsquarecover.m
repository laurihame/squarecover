function neliot=heuristicsquarecover(varargin)
global ratkaisut
ratkaisut={};
n = varargin{1};
syvyys = 1;

if size(varargin,2) > 1
    syvyys = varargin{2};
end

%%%%% heuristinen versio: kaydan lapi vain tietty maksimimaara
%%%%% haaroja jokaisessa risteyksessa
%%%%% depth voi olla myös murtoluku: tällöin käydään läpi
%%%%% floor(syvyys) + (rand() < syvyys - floor(syvyys)) haaraa!!

%rand ("seed", 0);
%%% mihin neliot tulevat (muotoa [vasen alanurkka])
more off;
neliot = [];
clf
points=10*rand(n,2);
points2=points;

%%%% 1. ratkaisu saadaan nurkka-eliminaatiolla
niter = n;
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


%kork
%size(points2)
if kork > 0 
    heuristinentokavaihe(points2,neliot,syvyys);
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


