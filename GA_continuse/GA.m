function BEST = GA(tf,itr_in,Nvars)
    %% parameters setting


                    % [ fn, down,  up, dim ] = F_index(x)
    nvar=Nvars;    % number of variable

    [ fitness, down,  up, nvar ] = F_index(tf);

    npop=10;         % number of population

    maxiter=itr_in;      % max of iteration


    pc=0.1;                  % percent of crossover
    ncross=2*round(npop*pc/2);   % number of cross over offspring

    pm=1-pc;                 % percent of mutation
    nmut=round(npop*pm);     % number of mutation offsprig

    lb=down*ones(1,nvar); 
    ub=up*ones(1,nvar); 


    %% initialization
 %%   tic
    empty.par=[];
    empty.fit=[];


    pop=repmat(empty,npop,1);


    for i=1:npop

       pop(i).par=lb+rand(1,nvar).*(ub-lb);
       pop(i).fit=fitness(pop(i).par);

    end




    %% main loop


    BEST=zeros(maxiter,1);
    MEAN=zeros(maxiter,1);

    for iter=1:maxiter


       % crossover

       crosspop=repmat(empty,ncross,1);
       crosspop=crossover(fitness,crosspop,pop,ncross);




       % mutation
       mutpop=repmat(empty,nmut,1);
       mutpop=mutation(fitness,mutpop,pop,nmut,npop,lb,ub,nvar);


       % merged
      [pop]=[pop;crosspop;mutpop];


      % select
      [value,index]=sort([pop.fit]);
      pop=pop(index);
      pop=pop(1:npop);

     gpop=pop(1);   % global pop



     BEST(iter)=gpop.fit;
     MEAN(iter)=mean([pop.fit]);



%     disp([ ' Iter = '  num2str(iter)  ' BEST = '  num2str(BEST(iter))]);


      if iter>150 && BEST(iter)==BEST(iter-150)
          break
      end

    end
    %% results

%    disp(' ')
%    disp([ ' Best par = '  num2str(gpop.par)])
%    disp([ ' Best fitness = '  num2str(gpop.fit)])
%    disp([ ' Time = '  num2str(toc)])



%    figure
%    plot(BEST(1:iter),'r','LineWidth',2)
 %   hold on
 %   plot(MEAN(1:iter),'b','LineWidth',2)


%    xlabel('Iteration')
%    ylabel(' Fitness')

%    legend('BEST','MEAN')


%    title('GA for TSP')
%    set(gca,'YScale','log')

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                                   %
    %                          www.matlabnet.ir                         %
    %                   Free Download  matlab code and movie            %
    %                          Shahab Poursafary                        %
    %                                                                   %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end



