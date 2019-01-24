function [P,L,U]=plu_felb(C)
% LEIRAS:
% 	A matrix PC=LU felbontasa,
% 	ahol:
%		C	:	nxn -es  matrix
%		P	: 	nxn -es, a reszleges foelemkivalasztas soran sorcsereket produkalo permutaciomatrix
% 		L 	:	nxn -es  alsoharomszog matrix
%		U	:	nxn -es  felsoharomszog matrix
% INPUT ADATOK:
%		C	:	(fent emlitett)
%	OUTPUT ADATOK:	
%		P,L,U	:	(fent emlitettek)
%===========================================
[m,n]=size(C);
P=eye(n);
L=zeros(n);
U=zeros(n);


% Gauss elim. reszleges foelemkivalasztassal, 0-k beirasa nelkul
for j=1:n
   
   % pivotelemet (max) keresunk a j-edik oszlopban
   max=j;
   for h=j:n
      if abs(C(h,j))>abs(C(max,j));
         max=h;
		end
	end

   % ha talaltunk nala nagyobb abszolutertekut az oszlopaban tole lefele, akkor sorcsere P-ben es C-ban
   if max~=j
      
      % megfelelo sorok csereje P -ben
	   temp=zeros(1,n);
   
	   temp=P(max,1:n);
		P(max,1:n)=P(j,1:n);
		P(j,1:n)=temp;

      
	   %megfelelo sorok csereje C -ban
  		temp=zeros(1,n);

		temp=C(max,1:n);
		C(max,1:n)=C(j,1:n);
		C(j,1:n)=temp;
	end
      
	% eliminacio, 0-k beirasa nelkul            
   for i=j:n-1
      gamma=C(i+1,j)/C(j,j);
      C(i+1,j+1:n)=C(i+1,j+1:n)-gamma*C(j,j+1:n);
   end
end


% U  "kiirasa" C-bol
for i=1:n
   U(i,i:n)=C(i,i:n);
   L(i:n,i)=C(i:n,i)/C(i,i);
end

     
   
    
    
    