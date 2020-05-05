function Xs = PG( Cnt , V,  Pop, Bound, idx , Fn)
    global DrawerLevel
    [r,c] = size(Cnt);
    Xs = ones(0,c);
    for i = 1:Pop
        R = rand(1,c);
        R = R*2 - 1;
        Dis = R.*V;
        X = Cnt + Dis;
        Xs = [Xs ; X];
    end
    if (DrawerLevel>2)
        drwRec(Cnt , V ,  Xs,Bound);
    end
    
end
function drwRec(P , v ,  X, Bound)
    hold on;
    [r ,c] = size(X);
    x = P(1);
    y = P(2);
    xs = [x-v  x-v x+v  x+v  x-v];
    ys = [y-v  y+v  y+v  y-v  y-v];
%    fill(xs,ys,'w');
    plot(xs , ys, '-g')
    hold on
    for i=1:r
        plot(X(i,1) , X(i,2) , '*r');
    end
    xlim( [ Bound(1); Bound(2) ] );
    ylim( [ Bound(1); Bound(2) ] );
end
