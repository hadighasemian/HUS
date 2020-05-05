function bestcost = PSO(tf, itr, nv)
    %tic

    num_iter=itr;
    num_pop=10;
    w=.7;
    c1=2;
    c2=2;

    %% Problem Definition
    [costfunction, min_var, max_var, num_var] = F_index(tf);

%   num_var=2;
%   min_var=-10;
%   max_var=10;
    phi1=2.05;
    phi2=2.05;
    phi=phi1+phi2;
    chi=2/(phi-2+sqrt(phi^2-4*phi));

    max_v=(max_var-min_var)/10;

    %% PSO Parameters




    %% Initial Population

    pop_position=zeros(num_pop,num_var);
    pop_velocity=zeros(num_pop,num_var);
    pop_cost=zeros(num_pop,1);
    pop_best_position=zeros(num_pop,num_var);
    pop_best_cost=zeros(num_pop,1);

    bestsol_cost=inf;          % best position  pg

    for i=1:num_pop

        pop_position(i,:)=unifrnd(min_var,max_var,1,num_var);
        pop_cost(i)=costfunction(pop_position(i,:));
        pop_best_position(i,:)= pop_position(i,:);
        pop_best_cost(i)=pop_cost(i);   %pi

        if pop_cost(i)< bestsol_cost

           bestsol_cost=pop_cost(i);
           bestsol_position=pop_position(i,:);

        end

    end

    bestcost=zeros(num_iter,1);

    %% Main Loop

    for it=1:num_iter
       % w=.9-(.2*it)/num_iter;

        for i=1:num_pop

            % new velocity
            pop_velocity(i,:)=w*pop_velocity(i,:) ...
                + c1*rand(1,num_var).*(pop_best_position(i,:)-pop_position(i,:)) ...
                + c2*rand(1,num_var).*(bestsol_position-pop_position(i,:));
            %max velocity
            flag=(pop_velocity(i,:)<-max_v);
            pop_velocity(i,flag)=-max_v;
            flag=(pop_velocity(i,:)>max_v);
            pop_velocity(i,flag)=max_v;

            pop_position(i,:)= pop_position(i,:)+pop_velocity(i,:);
            %max position
            flag=(pop_position(i,:)<min_var);
            pop_position(i,flag)=min_var;
            flag=(pop_position(i,:)>max_var);
            pop_position(i,flag)=max_var;

            pop_cost(i)=costfunction(pop_position(i,:));

            if pop_cost(i)<pop_best_cost(i)

                pop_best_position(i,:)=pop_position(i,:);
                pop_best_cost(i)=pop_cost(i);

            end

        end

        [~,index]=sort(pop_cost);

        if  pop_cost(index(1)) < bestsol_cost

            bestsol_cost=pop_cost(index(1));
            bestsol_position=pop_position(index(1),:);
        end

        bestcost(it)=bestsol_cost;

    %    disp(['Iteration' num2str(it) ': Best Cost= ' num2str(bestcost(it))]);
    end
    %toc
    bestcostit = bestcost(it);
end




