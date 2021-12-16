%metodo_Euler
%        [valor, error ,estabilidad] = metodo_Euler(funcion, intervalo, condicionInicial, iteraciones, orden);
%
%       Parámetros entrada
%            funcion= función anónima 
%            intervalo = intervalo a evaluar
%            condicionInicial = condicion inicial de la función 
%            iteraciones = Números de iteraciones máximas que se harán
%            orden = Orden de la función
%
%        Parámetros salida
%             valor = valor aproximado 
%             error= error aproximado en porcentaje
%             estabilidad = comportamiento de la solución numérica del mismo cuando se perturba el valor de la condición inicial.


function [valor, error, estabilidad] = metodo_Euler(funcion, intervalo, condicionInicial, iteraciones, orden);
  valoresX = [intervalo(1)];
  valoresY = [condicionInicial];
  iteraciones = iteraciones - 1;
  valorPaso = (intervalo(2)-intervalo(1))/iteraciones;
  for i = 1:iteraciones;
    pendiente = funcion(valoresX(length(valoresX)));
    nuevoY = valoresY(length(valoresY))+pendiente*valorPaso;
    nuevoX = valoresX(length(valoresX))+valorPaso;
    valoresX = cat(1, valoresX, nuevoX);
    valoresY = cat(1, valoresY, nuevoY);
  endfor
  syms x
  funcionSym = sym(funcion);
  error = 0;
  for i = 2:orden+1
    derivada = diff(funcionSym, i-1);
    errorNuevo  = double(subs(derivada, x, valoresX(length(valoresX)))/prod(1:i))*(valorPaso^i);
    error = error + errorNuevo;
  endfor
  valor = valoresY(end);
  a  =(-1/valorPaso)*( valor / valoresY(length(valoresY)-1) -1);
  if valorPaso>2/a
    estabilidad = "El método es condicionalmente estable";
   else
    estabilidad = "El metodo no es condicionalmente estable";
  endif
  valorReal = valor + error;
  error = error*100/valorReal;
   endfunction