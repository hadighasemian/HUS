nv = 30;
k=2;
minResult.Hus0000000000 = zeros(23,100);
double minResult.Hus000000000l;
minResult.Hus0000000111 = zeros(23,100);
double minResult.Hus0000000111;
minResult.Hus1000110001 = zeros(23,100);
double minResult.Hus1000110001;
for i=1:23
    for j=1:100
 %           figure
 %           hold on
            c1 = result.rHus0000000000(i, j, :);
            c1 = c1(1,:);
            minResult.Hus0000000000(i,j) = min(c1);
%            plot(c1,'-g');
            
            c1 = result.rHus0000000111(i, k, :);
            c1 = c1(1,:);
            minResult.Hus0000000111(i,j) = min(c1);
%            plot(c1,'-.b');    
            
            c1 = result.rHus1000110001(i, k, :);
            c1 = c1(1,:);
            minResult.Hus1000110001(i,j) = min(c1);
%            plot(c1,'--k');              
%           set(gca,'YScale','log');
%            legend('0000000000','0000000111','1000110001');
%            mnVl = minVal(i,nv);
%            tlt = strcat('F',num2str(i),' :Min Value =  ',num2str(mnVl),'Min000=',num2str(min(result.rHus0000000000(i, k, :))));
%            title(tlt);
    end
end