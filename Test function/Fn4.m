function z = Fn4(xy)
    x = xy(1);
    y = xy(2);
    z = - sin(x) .* (sin( x.^2 ./pi ).^2) -  sin(y) .* (sin(y.^2/pi ).^ 2);
end