%function  main( )
clear all;
    itr = 500;
    nv = 30;
    result.rHus = zeros(23,100,itr+1);
    double result.rHus;
    time.tHus = zeros(23,100,1);
    double time.tHus;
    
    result.rIca = zeros(23,100,itr);
    double result.rIca;
    time.tIca = zeros(23,100,1);
    double time.tIca;

    result.rPso = zeros(23,100,itr);
    double result.rPso;
    time.tPso = zeros(23,100,1);
    double time.tPso;

    result.rGa = zeros(23,100,itr);
    double result.rGa;
    time.tGa = zeros(23,100,1);
    double time.tGa;

    for i=1:23
        for j=1:100
%            figure
i,j
            tic;
            [c1,p1] = HUS(i, itr, nv,[1,1,1,0,0,0,0,0,0,0]);
            t1 = toc;
            result.rHus(i,j,:) = c1;
            time.tHus(i,j,:) = t1;
%            hold on
%             plot(c1,'-g');
    %        set(gca,'YScale','log');


%             tic;
%             c2 = ICA(i, itr, nv);
%             t2 = toc;
%             result.rIca(i,j,:) = c2;
%             time.tIca(i,j,:) = t2;            
    %        hus_p(i,:) = p1;
    %        hold on
     %       loglog(c2,'-.b');
      %      set(gca,'YScale','log');   


%             tic;
%             c3 = PSO(i, itr, nv);
%             t3 = toc;
%             result.rPso(i,j,:) = c3;
%             time.tPso(i,j,:) = t3;
    %        pso_p(i,:) = p;
     %       hold on
     %       plot(c3,'--k');
     %       set(gca,'YScale','log');
% 
%             tic;
%             c4 = GA(i, itr, nv);
%             t4 = toc;
%             result.rGa(i,j,:) = c4;
%             time.tGa(i,j,:) = t4;
    %        ga_p(i,:) = p;
    %        hold on
     %       plot( c3,':r');
     %       set(gca,'YScale','log');
             
%              [c4] = GSA(i, itr, nv);
%              result.rGsa(i,j,:) = c4;

             
             min_flag=1; % 1: minimization, 0: maximization
             ElitistCheck=1; 
             Rpower=1;
             [Fbest,Lbest,BestChart,MeanChart]=GSA(i,nv,itr,ElitistCheck,min_flag,Rpower);
             result.rGsa(i,j,:) = BestChart;
%              hold on
%              plot( c4,'pg');
%              set(gca,'YScale','log');
          
%            legend('HUS','ICA','PSO','GA');
%           mnVl = minVal(i,nv);
%            xlbl = strcat('Min Value =  ',num2str(mnVl));
%            xlabel(xlbl);
        end
    end
% end