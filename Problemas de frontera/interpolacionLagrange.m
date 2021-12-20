 %interpolacionLagrange
%       [ecuacion, valor] = interpolacionLagrange(x, y,  xi)
%
%       Parámetros entrada
%            x = vector  de dimensión n 
%            y = vector de dimensión n 
%            xi = valor en el que se desea aproximar la función
%
%        Parámetros salida
%             ecuacion = función que corresponde a la Interpolación polinomial  
%                                       de Lagrange de x,y.
%             valor = resultado de la aproximación de xi

function [ecuacion, valor] = interpolacionLagrange(x, y, xi);
  n = length(x);
  Lagrange = zeros(n,n);
  for i= 1:n;
    K = 1;
    for j=1:n;
      if i ~= j
        K= conv(K, poly(x(j)))/(x(i) - x(j));
      endif
    endfor
    Lagrange(i, :) = K*y(i);
  endfor
  
     % Creación de la ecuación a partir de los coeficientes
   coeficientes= sum(Lagrange);
   coeficientes = coeficientes(:, length(coeficientes):-1:1);
   ecuacion = 0;
   syms x;
   for i = 1:n;
   ecuacion = ecuacion  + coeficientes(i)*x.^(i-1);
   endfor
   ecuacion = matlabFunction(ecuacion);
   valor = double(subs(ecuacion, x, xi));   
endfunction
  
  