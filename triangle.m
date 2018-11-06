%This script is used to produce a triangle and find its area
%to demonstrate the idea of an integral

%generate accurate x array bx linspace is garbage
N = 500;
x = zeros(1,N);
xmax = 10;
increment = xmax/N;
for i = 1:N
    x(i+1) = x(i) + increment;
end

%plot curve
y = -x+10;
plot(x,y,'k');

%create rectangle to demonstrate integrals
hold on
rectArray = rectangles(y,x);
hold off

sumArea = sum(rectArray) %get sum of areas of rectangles
f = @(x) -x+10; %make function to get integral of using integral function
trueArea = integral(f,x(1),x(N))
error = abs(sumArea-trueArea)/trueArea*100 %percent error