function[optimization]=FMINCONfunction(fun,numE)
    function[c,ceq]=nlcon(x)
        c=[];
        ceq=x(numE)-1;
    end
x0=(1.0).*ones(numE,1);
A=[];
b=[];
Aeq=[];
beq=[];
lb=[];
ub=[];
nonlcon=@nlcon;
options=optimoptions('fmincon','Algorithm','sqp');
optimization=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
end
% ,'Algorithm','sqp','StepTolerance',1.0000e-10,'MaxFunctionEvaluations',120000