function derivative(p1, p2, graph, x, title)
    %get slope
    m = (graph(p2) - graph(p1))/(x(p2) - x(p1));
    %get y intercept
    b = graph(p1)-m*x(p1);
    %make line
    y = m*x + b;
    %plot line
    plot(x,y, 'DisplayName', title);
end

