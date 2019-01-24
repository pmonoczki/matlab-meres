function A=matrix(x,a)

%   a Faddeev-Sominskii-1 mátrix elöállitása
%
%   -----------------------------------------

n=length(a);
A=zeros(n);

for i=1:n
	for j=1:n
		if i==j
			A(i,j)=x;
        else if i>j
			    A(i,j)=a(j);
                else A(i,j)=a(j-1);
                end    
        end	
    end		 
end