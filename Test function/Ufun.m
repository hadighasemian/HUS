function y=Ufun(x,a,k,m)
    y=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end
