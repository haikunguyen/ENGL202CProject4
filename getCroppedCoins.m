%This script will demonstrate integrals with coins

%{
Algorithm:
*load coin image
*get height (diameter) of coin
*replicate coins on top of each other until it touches or exceeds
function curve by a small amount
*get area of coins
*compare to area of function curve
%}

I = imread('nickelelement.jpg');
[nx,ny,d] = size(I) ;
[X,Y] = meshgrid(1:ny,1:nx) ;
imshow(I) ;
hold on
[px,py] = getpts ;   % click at the center and approximate Radius

r = sqrt(diff(px).^2+diff(py).^2) ;
th = linspace(0,2*pi) ;
xc = px(1)+r*cos(th) ; 
yc = py(1)+r*sin(th) ; 
plot(xc,yc,'r') ;
% Keep only points lying inside circle
idx = inpolygon(X(:),Y(:),xc',yc) ;
for i = 1:d
    I1 = I(:,:,i) ;
    I1(~idx) = 255 ;
    I(:,:,i) = I1 ;
end
figure
imshow(I)