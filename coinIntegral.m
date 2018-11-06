%this script makes integrals out of the cropped coins

%generate accurate x array bx linspace is garbage
N = 500;
x = zeros(1,N);
xmax = 10;
increment = xmax/N;
for i = 1:N
    x(i+1) = x(i) + increment;
end

%plot curve
figure(1)
y = -x+10;

hold on
img = imread('quarter.jpg');
coinSize = 1.75;
startPt = 0.01;

for i = 1:length(x)
    x1(1) = startPt;
    x1(i+1) = startPt+i*coinSize;
    if (x1(i+1) >= xmax)
        break;
    else
        image('CData',img,'XData',[x1(i) x1(i+1)],'YData',[startPt startPt+coinSize])
    end
    
    for j = 1:length(x)
        y1(j) = startPt+j*coinSize;
        y1(j+1) = startPt+(j+1)*coinSize;
        if (y1(j+1) >= (-(i*coinSize+coinSize/2)+10))
            break;
        else
        image('CData',img,'XData',[x1(i) x1(i+1)],'YData',[y1(j) y1(j+1)])
        end
    end
    %}
end
plot(x,y,'k');
hold off