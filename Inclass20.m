%Inclass 20

%In this folder you will find a .mat file with x and y data

data = load('data.mat');

% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 

% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 

Mic_str = 'V*x/(K+x)';
Micmodel = fittype(Mic_str);
[Mic_out, Mic_metric] = fit(data.xx', data.yy', Micmodel, 'StartPoint', [2 4]);
figure
plot(Mic_out, data.xx', data.yy')
title('Michaelis function fit')

% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)

Hill_str = 'V*x^2/(K^2+x^2)';
Hillmodel = fittype(Hill_str);
[Hill_out, Hill_metric] = fit(data.xx', data.yy', Hillmodel, 'StartPoint', [2 4]);
figure
plot(Hill_out, data.xx', data.yy')
title('Hill function fit')

% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)

free_str = 'V*x^n/(K^n+x^n)';
freemodel = fittype(free_str);
[free_out, free_metric] = fit(data.xx', data.yy', freemodel, 'StartPoint', [2 4 2], 'Lower', [0 0 0]);
figure
plot(free_out, data.xx', data.yy')
title('Free coefficient fit')

% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

probmodel = fittype(free_str, 'problem', 'n');
[prob1_out, prob1_metric] = fit(data.xx', data.yy', probmodel, 'problem', 1, 'StartPoint', [2 4]);
[prob2_out, prob2_metric] = fit(data.xx', data.yy', probmodel, 'problem', 2, 'StartPoint', [2 4]);
figure
plot(prob1_out, data.xx', data.yy')
title('Fixed coefficient fit: n = 1')
figure
plot(prob2_out, data.xx', data.yy')
title('Fixed coefficient fit: n = 2')
