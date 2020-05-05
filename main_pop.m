%function  main( )
clear all;
    itr = 500;
    nv = 30;
    result.rHus0000000000 = zeros(23,100,itr+1);
    double result.rHus0000000000;
    time.tHus0000000000 = zeros(23,100,1);
    double time.tHus0000000000;

    result.rHus0000000111 = zeros(23,100,itr+1);
    double result.rHus0000000111;
    time.tHus0000000111 = zeros(23,100,1);
    double time.tHus0000000111;
    
    result.rHus1000110001 = zeros(23,100,itr+1);
    double result.rHus1000110001;
    time.tHus1000110001 = zeros(23,100,1);
    double time.tHus1000110001;
    
    
    for i=1:23
        for j=1:100
            tic;
            [c1,p3] = HUS(i, itr, nv,[0,0,0,0,0,0,0,0,0,0]);
            t1 = toc;
            result.rHus0000000000(i,j,:) = c1;
            time.tHus0000000000(i,j,:) = t1;
            
            tic;
            [c2,p3] = HUS(i, itr, nv,[0,0,0,0,0,0,0,1,1,1]);
            t2 = toc;
            result.rHus0000000111(i,j,:) = c2;
            time.tHus0000000111(i,j,:) = t2;
            
            tic;
            [c3,p3] = HUS(i, itr, nv, [1,0,0,0,1,1,0,0,0,1]);
            t3 = toc;
            result.rHus1000110001(i,j,:) = c3;
            time.tHus1000110001(i,j,:) = t3;
        end
    end
% end