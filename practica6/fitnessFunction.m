function y = fitnessFunction(x)
% 
kp = x(1);
ki = x(2);
kd = x(3);

set_param("p221/PID Controller","P","kp","I","ki","D","kd");


out = sim("p221.slx", "SrcWorkspace", "Current");

ise = out.ISE;
iae = out.IAE;
y = iae;

end