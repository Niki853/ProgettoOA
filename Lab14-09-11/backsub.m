function [x]=backsub(U,b)
% backsub: risolve un sistema triangolare superiore con il metodo di 
%sostituzioni all'indietro (bakcward substitution)
%  [x]=backsub(U,b)
% Input: U = matrice triangolare superiore
%            b = vettore colonna, termine noto
% Output: x= vettore soluzione 

[n,m]=size(U); % restituisce righe e colonne della matrice
if n~=m
    warning('La matrice non è quadrata')
    x= [ ];
else
    [p,q]=size(b);
    if p~=n || q~=1 
        warning('Il vettore termine noto non è compatibile con la matrice')
        x=[ ];
    else
        % la matrice e' quadrata, il vettore termine noto e' colonna della 
        % stessa dimensione di U
        % risolvo
        x=zeros(n,1); % inizializzo il vettore soluzione ad un vettore nullo
       for i=n:-1:1
           s=0;
           for j=i+1:n
               s=s+U(i,j)*x(j);
           end
          x(i)=(b(i)-s)/U(i,i);
       end
    end
end
    