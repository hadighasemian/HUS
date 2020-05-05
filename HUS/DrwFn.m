function DrwFn(f) 
    x =-10:.1:10;
    y =-10:.1:10;
    [t , ix] = size(x);
    [t , jy] = size(y);
    [X,Y] = meshgrid(x,y);

    for i = 1:ix
        for j = 1:jy
            Z(i,j) = f([X(i,j),Y(i,j)]);
        end
    end
    figure;
    meshc(X,Y,Z);
end
