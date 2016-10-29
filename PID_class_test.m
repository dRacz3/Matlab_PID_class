%PID TEST
clear all; clc;

%Init the controller object (Kp,Kd,Ki,timeStep)
Kp = 1; Kd = 1; Ki = 0.1; timeStep = 0.1;
PID = PID_Class(Kp,Kd,Ki,timeStep);


%Calculate simulation time
time = 3 %sec
numberOfCycles = time / timeStep;
log_output=zeros(1,numberOfCycles);
log_currentState=zeros(1,numberOfCycles);

%Init starting state, and setpoint 
currentState = 0;
setPoint = 10;


log_output(1) = 0;
log_currentState(1)= currentState;


for i = 1:numberOfCycles
    %Calculate PID signal
    output = PID.calcControl(setPoint,currentState);
    
    %Calculate the changed state, depending on the output
    currentState = currentState + (output * 0.01); 
    % Note: if you are working with a hardware, or anything in particular,
    % you should get this "currentState" variable from there, this equation
    % is just for simulation purposes
    
    
    %Log output, and state change for observing
    log_output(i+1) = output;
    log_currentState(i+1) = currentState;
end

plot(log_currentState);