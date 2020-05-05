function [out] = testfunc13(L)
dim = 30;
    fit=.1*((sin(3*pi*L(1)))^2+sum((L(1:dim-1)-1).^2.*(1+(sin(3.*pi.*L(2:dim))).^2))+...
        ((L(dim)-1)^2)*(1+(sin(2*pi*L(dim)))^2))+sum(Ufun(L,5,100,4));
out = fit;

end

