%Script to make a graph and plot its slopes

N = 5;
x = linspace(0, N, 1000*N);
%y = exp(-2*x);
y = -x
figure(1)
plot(x,y)