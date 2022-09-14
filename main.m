clear;clc;

%----------------------------Given Code --------------------------------

% Define an underlying function (line) in 2D
a=2; b=-2; 
hold on;

% Generate 20 random examples
N=20;
for i=1:N
 x = rand(1)*5; y = rand(1)*5;           % Generate random coordinates
 data(i,:) = [x y];                      % Saves the coordinates
 
 if (y > a*x + b )                       % If the point is above the line
 label(i) = 1; plot(x,y,'r+');           % Make it a positive example
 else
 label(i) = -1; plot(x,y,'go');          % Otherwise, make it negative
 end
end
%-------------------------------------------------------------------------


% optimize loss function
fun = @(x) loss_fun(x(1),x(2),data(1:N),data(N+1:2*N),label(1:N),N);
z=ga(fun,2,[],[],[],[],[-5,-5],[5,5])

% graph hypothesis
i = 0:5;
f = z(1)*i+z(2);
hold on
plot(i,f)

% display loss
disp("The Loss is: " + string(loss_fun(z(1),z(2),data(1:N),data(N+1:2*N),label(1:N),N)))




