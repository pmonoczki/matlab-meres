% teszt2.m
%
% M�k�dteti az matrix �s plu_felb programokat.
% Az inputadatokb�l elk�sz�ti a m�trixot, majd ugyanezt megteszi
% az inputok perturb�ltjaival. Elk�sz�ti az �gy kapott m�trixok LU felbont�s�t,
% �s meghat�rozza a PC-LU hibam�trix norm�t,majd a perturb�ci� ut�ni 
% hibam�trixok norm�it.
%_______________________________________________________________________________

n=20;
x=rand(1);
a=rand(1,n);
A=matrix(x,a);
p=5;
q=4;
C=triu(tril(A,q),-p);
[P,L,U]=plu_felb(C);
HIBA=norm(P*C-L*U,2);						
for i = 1 : 15 
    dA=(rand(n,n)*2e-4)-ones(n,n)*1e-4;
    dC=triu(tril(dA,q),-p);
    [Pd,Ld,Ud]=plu_felb(C+dC);
	 HIBAd(i,1)=norm(Pd*(C+dC)-Ld*Ud,2);  							
end
disp('A PC-LU norm�ja: '); 
HIBA 
disp('A perturb�lt m�trixokb�l k�pzett hiba norm�i: '); 
HIBAd