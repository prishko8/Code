function y=MatrixFit2(A, B)
Ones=ones(size(A)); 
Matr=zeros(2, 2);
Matr(1, 1)=sum(B.^2, 'all');
Matr(1, 2)=sum(B, 'all'); 
Matr(2, 1)=Matr(1, 2); 
Matr(2, 2)=sum(Ones, 'all'); 
Vect=zeros(2, 1);
Vect(1, 1)=sum(A.*B, 'all'); 
Vect(2, 1)=sum(A, 'all'); 
y=Matr^(-1)*Vect; 
end