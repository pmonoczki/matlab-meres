% teszt2.m
%
% Müködteti az matrix és plu_felb programokat.
% Az inputadatokból elkészíti a mátrixot, majd ugyanezt megteszi
% az inputok perturbáltjaival. Elkészíti az így kapott mátrixok LU felbontását,
% és meghatározza a PC-LU hibamátrix normát,majd a perturbáció utáni 
% hibamátrixok normáit.
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
disp('A PC-LU normája: '); 
HIBA 
disp('A perturbált mátrixokból képzett hiba normái: '); 
HIBAd