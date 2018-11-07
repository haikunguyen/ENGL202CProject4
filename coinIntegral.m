%this script gets an estimation of the area under a curve using cropped
%coin pictures

%generate accurate x array bx linspace is garbage
N = 500;
x = zeros(1,N);
xmax = 10;
increment = xmax/N;
for i = 1:N
    x(i+1) = x(i) + increment;
end

%curve to be plotted
y = -x+10;

%Get actual integral
f = @(x) -x+10;
actualArea = integral(f,0,10)

%Create struct to load information
coins(1).name = 'coin_quarter.jpg';
coins(1).diameter = 0.955;

coins(2).name = 'coin_nickel.jpg';
coins(2).diameter = 0.835;

coins(3).name = 'coin_dime.jpg';
coins(3).diameter = 0.705;

%Getting estimation of area under curve using coins
for a = 1:3
    figure(a)
    img = imread(coins(a).name); %read images
    hold on %hold figure to add other stuff to it
    coinSize = coins(a).diameter; %inches
    startPt = 0.01; %start point on plot
    coinCount = 0; %tracker for number of coins plotted
    
    for i = 1:length(x) %iterate for horizontal length of curve
        x1(1) = startPt;
        x1(i+1) = startPt+i*coinSize;
        if (x1(i+1) >= xmax) %if the next coin's width equals or exceeds curve, then stop.
            break;
        else
            image('CData',img,'XData',[x1(i) x1(i+1)],'YData',[startPt startPt+coinSize]);
            coinCount = coinCount+1;
        end

        for j = 1:length(x) %iterate for vertical length of curve
            y1(j) = startPt+j*coinSize;
            y1(j+1) = startPt+(j+1)*coinSize;
            image('CData',img,'XData',[x1(i) x1(i+1)],'YData',[y1(j) y1(j+1)]);
            coinCount = coinCount+1;
            if (y1(j+1) > (-((i-1)*coinSize+coinSize/2)+10)) %if next coin's height equals or exceeds curve, then stop.
                break;
            end
        end
    end
    coinCount %display number of coins on plot for each coin
    plot(x,y,'k'); %plot line over coins
    hold off %release figure
    %Get accuracy of summation with coins vs actual integral
    R = coinSize/2; %get radius of coin
    coinArea = pi*R^2; %get area of coin
    coinAreaSum = coinCount*coinArea %get estimation of area through summation
    error = abs(coinAreaSum-actualArea)/actualArea*100 %get error of estimation vs actual
end
