function u = onkosisalla(nelio,piste)
%%%% onko piste nelion sisalla
u=0;
%piirranelio(nelio);
if (nelio(1) < piste(1) && nelio(1)+1 > piste(1) && nelio(2) < piste(2) && nelio(2)+1 > piste(2) )
	u=1;
end

