function [ fn, down,  up, dim ] = F_index(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
        dim = 30;
        if x == 1
            fn = @testfunc1;
            down=-100;up=100;
        elseif x == 2
            fn = @testfunc2;
            down=-10;up=10;
        elseif x == 3
            fn = @testfunc3;
            down=-100;up=100;
        elseif x == 4
            fn = @testfunc4;
            down=-100;up=100;
        elseif x == 5
            fn = @testfunc5;
            down=-30;up=30;
        elseif x == 6
            fn = @testfunc6;
            down=-100;up=100;
        elseif x == 7
            fn = @testfunc7;
            down=-1.28;up=1.28;
        elseif x == 8
            fn = @testfunc8;
            down=-500;up=500;
        elseif x == 9
            fn = @testfunc9;
            down=-5.12;up=5.12;
        elseif x == 10
            fn = @testfunc10;
             down=-32;up=32;
        elseif x == 11
            fn = @testfunc11;
             down=-600;up=600;
        elseif x == 12
            fn = @testfunc12;
             down=-50;up=50;
        elseif x == 13
            fn = @testfunc13;
             down=-50;up=50;
        elseif x == 14
            fn = @testfunc14;
            down=-65.536;up=65.536;dim=2;
        elseif x == 15
            fn = @testfunc15;
            down=-5;up=5;dim=4;
        elseif x == 16
            fn = @testfunc16;
            down=-5;up=5;dim=2;
        elseif x == 17
            fn = @testfunc17;
            down=-5;up= 15;dim=2;
        elseif x == 18
            fn = @testfunc18;
            down=-2;up=2;dim=2;
        elseif x == 19
            fn = @testfunc19;
            down=0;up=1;dim=3;
        elseif x == 20
            fn = @testfunc20;
            down=0;up=1;dim=6;
        elseif x == 21
            fn = @testfunc21;
            down=0;up=10;dim=4;
        elseif x == 22
            fn = @testfunc22;
            down=0;up=10;dim=4;
        elseif x == 23
            fn = @testfunc23;            
            down=0;up=10;dim=4;
        end
end

