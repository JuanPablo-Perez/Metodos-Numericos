%goldenLine
%       [golden] = goldenLine(funcion, intervalo, puntoInicial, direccion,   iterMax, tolerancia=1e-7)
%
%       Parámetros de entrada
%            funcion= función anónima
%            intervalo = intervalo a evaluar
%            puntoInicial = punto para la primera iteración
%            direccion = $$$$$
%            iterMax = numero de iteraciones maximas
%            tolerancia = tolerancia deseada
%
%
%        Parámetros salida
%            golden= 

function [golden] = goldenLine(funcion, intervalo, puntoInicial, direccion,   iterMax, tolerancia=1e-7)
  syms x y z
  if intervalo(1) >= intervalo(2)
    msgID = 'Golden Line:intervalos';
    msg = "El intervalo especificado no es  correcto. 'El primer termino debe ser menor al segundo";
    error(msgID,msg)
  endif
  radioDorado = (3 - sqrt(5))/2;
  a = intervalo(1);
  b = intervalo(2);
  x1 = a*(1-radioDorado) + b*radioDorado;
  x2 = a*radioDorado + b*(1 - radioDorado);
  fx1 = funcion(puntoInicial + (x1*direccion)');
  fx2 = funcion(puntoInicial + (x2*direccion)');
  iteraciones = 1;
  while iteraciones <= iterMax
    iteraciones = iteraciones + 1;
    if fx1 > fx2
      a = x1;
      x1 = x2;
      fx1 = fx2;
      x2 = a*radioDorado + (1-radioDorado)*b;
      fx2 = funcion(puntoInicial + (x2*direccion)');
    else
      b = x2;
      x2 = x1;
      fx2 = fx1;
      x1 = b*radioDorado + (1-radioDorado)*a;
      fx1 = funcion(puntoInicial + (x1*direccion)');
    endif
    golden = [x1, fx1];
    if abs(funcion(puntoInicial + (x1*direccion)') - funcion(puntoInicial + (x2*direccion)')) < tolerancia
      return
    endif
  endwhile
  msgID = 'Golden Line:numero iteraciones';
  msg = "Se excedio el numero de iteraciones, posiblemente el mÃ©todo diverge'";
  error(msgID,msg)
  endfunction