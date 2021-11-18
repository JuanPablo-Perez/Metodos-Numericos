%interpolacionSPLINE_Cuadratica

function [ecuacion, valor, xValores, yValores] = interpolacionSPLINE_Cuadratica(x, y, xi)
n= length(x) - 1;

hdeZeros = zeros(2*n-2,3*n);
kdeZeros= zeros(2*n-2,1);

for i = 1:(n-1)
    col = i;
    row = 2*(i-1)+1;
    hdeZeros (row,col) = x(i+1)^2;
    hdeZeros (row+1,col+1) =x(i+1)^2;
    hdeZeros (row,n+col) = x(i+1);
    hdeZeros (row+1,n+col+1) = x(i+1);
    hdeZeros (row,2*n+col) = 1;
    hdeZeros (row+1,2*n+col+1) = 1;
    kdeZeros(row) = y(i+1);
    kdeZeros(row+1) = y(i+1);
endfor

hUno = zeros(n-1,3*n);
for i = 1:n-1
    hUno(i,i) = 2*x(i+1);
    hUno(i,i+1) = -2*x(i+1);
    hUno(i,n+i) = 1;
    hUno(i,n+i+1) = -1;
endfor

%Arreglo de valores
hSegundo = zeros(2,3*n);
hSegundo(1,1) = x(1)^2;
hSegundo(1,n+1) = x(1);
hSegundo(1,2*n+1) = 1;
hSegundo(2,n) = x(end)^2;
hSegundo(2,2*n) = x(end);
hSegundo(2,end) = 1;

% Cálculo de H
H = [hdeZeros;hUno;hSegundo];
[r,c] = size(H);

% Cálculo de K
k = zeros(r,1);
k(1:(2*(n-1))) = kdeZeros;
k(end-1) = y(1);
k(end) = y(end);

H = H(:,2:end);

coeficientes = inv(H)*k;

% Cálculo de coeficientes
A = [0;coeficientes(1:n-1)];
B = coeficientes(n:2*n-1);
C = coeficientes(2*n:end);
xValores = [];
yValores = [];
syms z
valorAnterior =0;
for i= 1:n
    xspline = linspace(x(i),x(i+1),10);
    yspline = A(i)*xspline.^2 + B(i)*xspline + C(i);
    ecuacion = double(A(i))*z^2 + double(B(i))*z+double(C(i)) 
    xValores  = cat(1, xValores, xspline);
    yValores = cat(1, yValores, yspline);
    if min(xspline) <= xi <= max(xspline)
      valorNuevo= double(subs(ecuacion, z, xi));
      if round(valorNuevo) == round(valorAnterior)
        valor = valorNuevo;
      endif
    endif
   valorAnterior = valorNuevo;
end

endfunction