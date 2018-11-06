function [output] = rectangles(curve,x)
    for i = 2:length(x)
        xwidth = [x(i-1) x(i)]; %get width for rectangle
        tofunction = [0 curve(i)]; %get height from 0 to function line
        height = [curve(i) curve(i)]; %height of function for top horizontal line
        
        line([x(i) x(i)],tofunction); %plot right vertical line to function
        line([x(i-1) x(i-1)],tofunction); %plot left vertical line equal in length to right vertical line
        line(xwidth,height); %plot top horizontal line
        
        %fill space in generated rectangles
        newx = linspace(x(i-1),x(i),1E3);
        newy = linspace(curve(i),curve(i),1E3);
        area(newx,newy)
        
        %get area of each rectangle
        rectArea(i-1) = (x(i)-x(i-1))*curve(i);
    end
    
    output = rectArea; %output rectangle area array
end

