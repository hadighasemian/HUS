function [FCapitals , point_number] = HUS(tf,itr_in,Nvars,ind)
%% tempreture variable
fff = zeros(1,0);
lll = zeros(1,0);
%% input variable
    N = 10;                     %Number of advanture.
    itr = itr_in;
    K = 2;
    Rimpk = 1;                   % radius factor
    Dim = Nvars;
%     Pop = N:-1:1;
     Pop = [1,1,1,1,1,1,1,1,1,1];

    [Fn, minVar, maxVar, Dim]= F_index(tf)   ;   %  [ fn, down,  up, dim ] = F_index(x)

    Bound = [minVar,maxVar];
    global DrawerLevel;
    DrawerLevel =0;
    point_number = zeros(1,itr);
 %% initialization step
    Ind = zeros(1,10);
     Ind = ind;             
    Citizen = ones(0, Dim);
    Rad = rand(1,N);
    FCapital = inf;
    Capital = 0;    
    Capitals = ones(0,Dim);

    


%% first interation
    
    X =initialX(N , Dim , Bound);                    % first generation of advanturer is initialed
   Cnt = initialCnt( X, Fn );               % first generation of every city is equal to Advanturer (X) result. 
   FnCnt = FnVal(Fn,Cnt);
   
%   point_number(1) = point_number(1) + N;  % N point generated
   Capital = Cnt(1, : );
   Capitals = [Capitals ; Capital ];
   FCapital = Fn(Capital);
   FCapitals = FCapital ;  
   
    
    Rad = calcRad(FnCnt , FCapital , Pop, itr , 1, Rimpk);
    [Citizen,Idx] = Locate(Cnt , Rad , Pop, N,Bound,  Fn ); %(Citizen , Cnt , Rad , Pop, N, Bound, Idx ,Fn)
%    point_number(1) = point_number(1) + sum(Pop);
    [Cnt, FnCnt] = FindBest(Fn ,Citizen,Cnt , Idx);   %    [Cnt, FnCnt] =  FindBest(Fn , Citizen,Cnt, Idx)
    
    for i=1:itr
        [X, FnX] = Adventure(Fn , X  , N, K, Cnt, Pop, Capital, Bound);   %[X, FnX] = Adventure(Fn , X  , N,K, Cnt, Pop, Capital,Bound)
 %       point_number(i) = point_number(i) + N;  
        Ind = specifyInd(Ind , N);
        [Cnt, FnCnt, Pop] = UpdateCenter(Fn , Cnt , X , Rad , Pop, Ind); %found overlap and add beter center.[Cnt, FnCnt, Pop] = UpdateCenter(Fn , Cnt , X , Rad,Pop,Ind)
%        FnCnt = FnVal(Fn,Cnt);
%        fff = [fff,min(FnCnt)];
%        fff = [fff,min(FnCnt)];
%        point_number(i) = point_number(i) + N;  
        for il = 1:2       
            Rad = calcRad(FnCnt , FCapital , Pop, itr, i, Rimpk); 
            [Citizen,Idx] = Locate(Cnt , Rad , Pop, N,Bound,  Fn );%(Citizen , Cnt , Rad , Pop, N, Bound, Idx ,Fn)
%            point_number(i) = point_number(i) + sum(Pop);
            lCapital = Cnt(1,:);
             [Cnt, FnCnt] = FindBest( Fn , Citizen, Cnt, Idx );   
            lll = [lll,min(FnCnt)];
%            if ( Fn(Cnt( 1 , :))  < Fn(Capital))
                Capital = Cnt( 1 , :);
%               dff(i) =Fn(lCapital) - Fn(Capital) ;
               FCapital = Fn(Capital);
               if (il == 1)
                    Capitals = [Capitals,Capital];
                    FCapitals = [FCapitals, FCapital ] ;
               end
                if (DrawerLevel>4)
                    figure(10000)
                    hold on
                    plot(i,FCapital);
                    set(gca,'YScale','log')
                end
%           end     
        end    
    end 
    if (DrawerLevel>1)
        DrwFn(Fn);
    end
    if (DrawerLevel>0)
        figure
     %   bar(dff)
     %   set(gca,'YScale','log')
        [t1,nt] = size(FCapitals);
        t1 = 1:nt;

        figure;
        plot (t1 , FCapitals);
        plot(fff,'r');
        hold on;
        plot(lll,'y');
        set(gca,'YScale','log')
     %    xlim([[1; nt]]);
     %    ylim([0; 1.0e-10]);
        lbl =strcat('Fn(' ,   num2str(Capital(1)) , ' , '  , num2str(Capital(2)) , ') = ' , num2str(Fn(Capital)));
        xlabel(lbl);
    end


    
end 
function value = FnVal(Fn,Cnt)
    [m,n] = size(Cnt);
    value = zeros(0,0) ;
    for i=1:m
        Fit = Fn(Cnt(i,:));
        value = [value;Fit];
    end
end
function Ind = specifyInd(Ind , N)
%    Ind = zeros(1,N);
%    k = 1;
%    Ind = (N/2)*k:-1*k:(N/2*(-1) + 1)*k;
 %   Ind = N:1;
 %   Ind = zeros(1,N);
 %   Ind = ones(1,N);
%    Ind = Ind;
    
end
function  [Cnt, FnCnt, Pop] = UpdateCenter(Fn , Cnt , X , Rad,Pop,Ind)

    
    [rx , cx] = size(X);
    [rc , cc] = size(Cnt);
    TX = ones(0,cx);
    for i=1:1:rx
        flg = 0;
        for j=1:1:rc
            dis = X(i , :) - Cnt(j, : );
            dis = abs(dis);
            con = find( (dis < Rad(j)) == 0);
            [n , m] = size(con);
            if ( m == 0 )
                Pop(j) = Pop(j)+Ind(j) ;
                flg = 1;
                break;
            end
        end
        if (flg == 0 )
            TX = [TX;X( i , : )];
        end
    end
    Cnt = [TX ; Cnt];
    [Cnt, FnCnt] =sortPont(Fn , Cnt);     % [X, FnX] = sortPont(Fn , X)
    Cnt = Cnt(1:rx , : );
    FnCnt =  FnCnt(1:rx , : );
end
function  [Cnt, FnCnt] =  FindBest(Fn , Citizen,Cnt, Idx)
    iBrethrens = ones(1,0);
    [N , t] = size(Cnt) ;
    for i=1:1:N
        iBrethrens = find(Idx == i );
        Brethrens = Citizen(iBrethrens , : );
        Fit =  FnVal(Fn,Brethrens);
        [MinG,id] = min( Fit);
         FnCnt = Fn(Cnt(i,:));
        if   (MinG < FnCnt)
            Cnt(i,:) = Brethrens(id,:);
        end
    end
    [Cnt, FnCnt] = sortPont(Fn , Cnt);  
end


function [X, FnX] = Adventure(Fn , X  , N,K, Cnt, Pop, Capital,Bound)

    [r ,c] = size(Cnt);
%% calculate Avg
    itr = N;
    sums = zeros(1, c);
    for i=1:itr
        mul = Pop(i) .* Cnt(i,:);
        sums = sums + mul;
    end
    avg = sums./sum(Pop(1:itr));
 %% 
    R1 = rand(1,c); R2 = 1 - R1;
    K1 = 1;
    for i=1:itr
        DPnt(i , :) = ( K1 * (R1 .* X(i , :))  + K * (R2 .* avg)  ) ./ (K1+K);
    end
    %%
    X = DPnt ;
    [X, FnX] =sortPont(Fn , X);

    
end
function [Citizen,Idx] = Locate( Cnt , Rad , Pop, N, Bound ,Fn)
    global DrawerLevel
    [r , c] = size(Cnt);
    Citizen = ones(0,c);
    Idx = ones(1,0);  
    if (DrawerLevel>2)     
        countr(Fn,Bound);
    end
    for i=1:N
         t = PG(Cnt( i , : ) , Rad(i), Pop(i), Bound, i, Fn);   %PG( Cnt , Rad,  Pop, Bound, idx, Fn)
         Citizen = [Citizen;t];
         Idx = [Idx, ones(1,Pop(i))*i];
    end
end
function countr(Fn,Bound)
            step = (Bound(2) - Bound(1))/40;
            step = .8;
            figure
            hold on;
            x = Bound(1):step:Bound(2);
            y = Bound(1):step:Bound(2);
            [X,Y] = meshgrid(x,y);
            [t , ix] = size(X);
            [t , jy] = size(Y);
            for i = 1:ix
                for j = 1:jy
                    Z(i,j) = Fn([X(i,j),Y(i,j)]);
                end
            end
            contour(X,Y,Z)   
            hold on;
end
function Rad = calcRad( FnCnt , FCapital, Pop, itr, i ,Rimpk)
     [ r,c ] = size(FnCnt);
     FnCnt = imrotate(FnCnt, 90);
     %%  compute K factor
     e=  (500*pi) / 2;
     s =  e / itr ;
     K = 50*(cos(i*s)+1)/(i^Rimpk);
    Dif = abs (( FCapital - FnCnt )/FCapital );
    Dif = atan(Dif)+.5;
%% compute Random factor
    R = rand(1,r);
%% main formul for calculate Radius (Rad)
    Rad = K*(Dif.* R) ./Pop;
end
function [X] = initialX(N , Dim , Bound)
    X = ones(N,Dim);
    Len = Bound( 2 ) - Bound( 1 );
    R = rand(N,Dim);
    X = R.*Len + Bound(1 );
end
function X = initialCnt( X, Fn )
    Fit = FnVal(Fn,X);
    [Fit , Ord] = sort(Fit);
     X = X(Ord,:);
end
function [X, FnX] = sortPont(Fn , X)
    FnX = FnVal(Fn, X);
    [FnX , Ord] = sort(FnX);
     X = X(Ord, : );
end
