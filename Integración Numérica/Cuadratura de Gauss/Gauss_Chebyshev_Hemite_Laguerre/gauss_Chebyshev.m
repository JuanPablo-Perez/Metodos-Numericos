%gauss_Chebyshev
%       [valor, error] = gauss_Chebyshev(funcion, n)
%
%       Parámetros entrada
%            funcion = f(x) tal que F(x) = f(x)*(1-x^2)^(1/2) 
%            n = número de puntos base
%
%        Parámetros salida
%             valor = valor aproximado de la integral
%             error = error en el cálculo de la integral


function [valor, error] = gauss_Chebyshev(funcion, n)
  syms x;
  funcionCompleta = funcion(x) *1/sqrt(1-x^2);
  funcionCompleta = matlabFunction(funcionCompleta);
  integralReal = integral(funcionCompleta, -1, 1);
  Ai = pi / (n+1);
  valor = 0;
  for j = 1:n
    xiNuevo  = cos( ((2*j+1)*pi)/(2*n+2) );
    valor = valor + Ai*funcion(xiNuevo);
  endfor
  error = (valor - integralReal)*100/integralReal; 
endfunction
