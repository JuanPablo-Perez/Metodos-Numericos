

function [valor, error] = integralTrapecio(funcion, intervalo)
  a = intervalo(1);
  b = intervalo(2);
  integralReal = integral(funcion, a, b);
  valor = double((b-a)*(funcion(a)+funcion(b))/2);
  error = abs(valor - integralReal)*100/integralReal;
endfunction
  