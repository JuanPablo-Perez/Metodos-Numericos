%integral_Impropia
%        [valor, error] = integral_Impropia(funcion, intervalo);
%
%       Parámetros entrada
%            funcion= función anónima 
%            intervalo = intervalo a evaluar
%
%        Parámetros salida
%             valor = valor aproximado de la integral
%             error= error aproximado de la integral en porcentaje



function [valor, error] = integral_Impropia(funcion, intervalo);
  a = intervalo(1);
  b = intervalo(2);
  integralReal = integral(funcion, a, b);
  
  if a > 0
      randomB = abs(randn(1));
      randomB = 2;
  else 
      randomB = -abs(randn(1));
      randomB = -2;
  endif

  if a*b >0
    intervalo = [1/b, 1/a];
    syms x;
    funcion = sym(funcion(1/x))*(1/x.^2);
    funcion = matlabFunction(funcion);
    integralFinal = integral(funcion, intervalo(1), intervalo(2));
  else
    intervalo1 = [1/randomB, 1/a];
    syms x;
    funcionNueva = sym(funcion(1/x))*(1/x.^2);
    funcionNueva = matlabFunction(funcionNueva);
    integralPrimera = integral(funcionNueva, intervalo1(1), intervalo1(2));
    intervalo2 = [randomB, b];
    [integralSegunda, error, sin] = reglaSimpson13(funcion, intervalo2,  8);
    integralFinal = integralPrimera+integralSegunda;
  endif
  valor = integralFinal;
  error = abs((valor - integralReal)/integralReal * 100);
endfunction
