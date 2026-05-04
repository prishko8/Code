function y=Deviate(A, B)
    y.Diff=norm(A-(A'*B)*B/(B'*B))/norm(A); 
    y.Fact=(A'*B)/(B'*B); 
end