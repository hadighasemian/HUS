function z = Fn6(xy)
    x = xy(1);
    y = xy(2);
    z =   10.2 + floor(x.^2 - 10*cos(2*pi.*x)) + floor( y.^2 - 10*cos(2*pi.^y)) ;
end