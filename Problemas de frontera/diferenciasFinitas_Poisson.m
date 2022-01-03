%diferenciasFinitas_Poisson
%       function [solucion] = diferenciasFinitas_Poisson(intervalo, numIteraciones)
%
%       Parámetros entrada
%            intervalo = intervalo a evaluar
%            numIteraciones = iteraciones máximas deseada
%
%        Parámetros salida
%             solucion = solucion usando el metodo de diferencias finitas de Poisson
%


function [solucion] = diferenciasFinitas_Poisson(intervalo, numIteraciones)
  paso = (intervalo(1)-intervalo(2))/numIteraciones;
  valoresX = intervalo(1):(intervalo(2)-intervalo(1))/numIteraciones:intervalo(2);
  coeficientes = zeros(numIteraciones+1, numIteraciones+1);
  coeficientes(1, 1) = 1;
  for i = 2:numIteraciones;
    coeficientes(i, [i-1 i i+1]) = [1 -2 1];
  endfor
  coeficientes(numIteraciones+1, numIteraciones+1) = 1;
  termIndependientes= zeros(numIteraciones+1, 1);
  termIndependientes(1) = 0;
  termIndependientes(2: numIteraciones) = 12*valoresX(2: numIteraciones).^2*(paso^2);
  termIndependientes(numIteraciones+1) = 0;
  [s, solucion] = gauss_jordan(coeficientes, termIndependientes);
  endfunction