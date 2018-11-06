%Program to create to graphically display the division of a circle into N
%parts

N = 200                       % Number Of Segments
a = linspace(0, 2*pi, N*1000);
r = 1;
x = r*cos(a);
y = r*sin(a);
sect = linspace(0, 360/N)/180*pi;

figure(1)
plot(x, y)

hold on
plot([zeros(1,N); x(1:1000:end)], [zeros(1,N); y(1:1000:end)])
patch([0 cos(sect) 0], [0 sin(sect) 0] ,'r')
hold off
axis equal
