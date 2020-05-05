
function z = Fn2(xy)
    x = xy(1);
    y = xy(2);
    z = (sqrt(x.^2 + y.^2) + eps);
    z = -sin(z)./z;
end