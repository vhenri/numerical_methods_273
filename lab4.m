clear all; 
close all; 

%% Set up initial conditions and variables
% Given bracketing interval 
br_int = [ -6 -3; -3 0; 0 3; 3 6; 6 9];

%Our given function
f = @(x) [2.*sin(x)-(x.^2)./30] ;

range = -6:9; 
hold on;
fplot(f, [-6, 9]);

%compute the golden ration
golden = (sqrt(5) - 1)./2 ;
epsilon = 0.001;


%% Golden Section Search

% first loop goes through the given bracketing intervals
for i = 1: length(br_int);
    xup = br_int(i,2); % load x upper guess starting points
    xlow = br_int(i,1); % x lower guess starting points
    
    d = golden * (xup - xlow); % difference between the upper and lower bound * golden ratio
    x1 = xlow + d; %potential new upper value
    x2 = xup - d; %potential new lower value
    
    count = 0; %resets the count variable for the next set
    xopt = 0; %resets the output value
    
    % second loop goes through the golden search method iteratively
    while (abs(xlow-xup) / xlow> epsilon)
        count = count +1; %counts the number of iterations before epsilon is hit 
        f(x2);
        f(x1); 
       
        d= golden*(xup-xlow); %compute the difference
        
        %comparison statements
        
        %change the upper value only (xlow=xlow)
        if (f(x2)>f(x1)); 
            xup = x1;
            x1 = x2;
                
            %shrink the interval
            x2=xup-d;

            %incase this is the last iteration, put this value in output
            xopt = xup; 
            
        % change the lower value only (xup = xup)
        else (f(x1)>f(x2));
            xlow = x2;
            x2 = x1;

            %shrink the interval
            x1 = xlow + d;
            
            %incase this is the last iteration, put this value in output
            xopt = xlow; 
        end
    end
    
% Place final results into the table
% xopt = location of min or max
% fm_out = function value of the min or max
% count = number of function evaluations needed to find max or min


 fin(i,1) = xopt;
 fin(i,2) = f(xopt);
 fin(i,3) = count;
 
 plot (xopt, f(xopt), '*r')
 
end
hold off

fprintf('    xopt     f(xopt)     N   \n');
fin

