%This script is used to produce a triangle and find its area
%to demonstrate the idea of an integral

N = [5 10 20 500];
for a = 1:length(N)
    %generate accurate x array bx linspace is garbage
    x = zeros(1,N(a));
    xmax = 10;
    increment = xmax/N(a);
    for i = 1:N(a)
        x(i+1) = x(i) + increment;
    end

    %plot curve
    y = -x+10;
    figure(a)
    plot(x,y,'k');

    %create rectangle to demonstrate integrals
    hold on
    rectArray = rectangles(y,x);
    hold off

    sumArea = sum(rectArray) %get sum of areas of rectangles
    f = @(x) -x+10; %make function to get integral of using integral function
    trueArea = integral(f,x(1),x(N(a)))
    error = abs(sumArea-trueArea)/trueArea*100 %percent error
end