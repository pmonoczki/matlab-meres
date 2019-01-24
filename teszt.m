function teszt

for n=8:4:12

    x=rand(1);
    a=rand(1,n);

    C=matrix(x,a);

    % Megadjuk a sávszélességet
    p=input('Kérem adja meg az alsó sávszélességet: ');
    q=input('Kérem adja meg a felsö sávszélességet: ');

    C_sav=triu(tril(C,q),-p);
	
    for i=1:n
    	x=1;
    	for j=1:n
    		if (C(j,i)~=0)
    			C_oszlop(x,i)=C(j,i);
    			x=x+1;
    		end	
    	end
    end

    [P,L,U]=plu_felb(C_oszlop)

    %Matlab rutinnal
    [Lm,Um,Pm]=lu(C_oszlop)

    C_sav=sparse(C_sav)

    [L,U,P]=lu(C_sav)

end