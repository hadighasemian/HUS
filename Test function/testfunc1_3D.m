function Z = testfunc1_3D(A)
X = A(1); Y = A(2);
Z = X .* exp(-X.^2 - Y.^2);  
end