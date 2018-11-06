%Script to make an exponentially decaying graph and derivatives

x = linspace(0,10,1E3);
y = exp(-x);

plot(x,y,'b','LineWidth', 2);
axis([0,10,0,1]);
legend('curve');
hold on
%Different slopes along curve
set1 = [350 352 354 356];
set2 = [351 353 355 357];

for i = 1:length(set1)
    title = strcat(['derivative ' num2str(i) ' of curve']);
    derivative(set1(i),set2(i),y,x,title);
end
legend(gca, 'show')

hold off

