%Script to make a graph and plot its slopes

N = 10;
x = linspace(0, N, 1000*N);
%y = exp(-2*x);
y = -x+10;
figure(1)
plot(x,y)
area(x,y);
axis([0 10 0 10])