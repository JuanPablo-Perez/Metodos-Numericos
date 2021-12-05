% funcion = f(x) tal que F(x) = f(x)*(1-x^2)^(1/2)

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