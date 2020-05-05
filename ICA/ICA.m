function BestCost = ICA(tf,itr_in,Nvars)
%tic

%CostFunction=@testfunc1;        % Cost Function
%nVar=Nvars;             % Number of Decision Variables

[ CostFunction, VarMin,  VarMax, nVar ] = F_index(tf);
MaxIt=itr_in;          % Maximum Number of Iterations
nPop=10;            % Population Size
nEmp=3;            % Number of Empires/Imperialists
VarSize=[1 nVar];   % Decision Variables Matrix Size
%% ICA Parameters
alpha=5;            % Selection Pressure

beta=2;             % Assimilation Coefficient

pRevolution=0.1;    % Revolution Probability
mu=0.05;            % Revolution Rate

zeta=0.1;           % Colonies Mean Cost Coefficient

ShareSettings;


%% Initialization

% Initialize Empires
emp=CreateInitialEmpires();

% Array to Hold Best Cost Values
BestCost=zeros(MaxIt,1);


%% ICA Main Loop

for it=1:MaxIt
    
    % Assimilation
    emp=AssimilateColonies(emp);
    
    % Revolution
    emp=DoRevolution(emp);
    
    % Intra-Empire Competition
    emp=IntraEmpireCompetition(emp);
    
    % Update Total Cost of Empires
    emp=UpdateTotalCost(emp);
    
    % Inter-Empire Competition
    emp=InterEmpireCompetition(emp);
    
    % Update Best Solution Ever Found
    imp=[emp.Imp];
    [~, BestImpIndex]=min([imp.Cost]);
    BestSol=imp(BestImpIndex);
    
    % Update Best Cost
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
    %  disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
end

%% Results
%toc

