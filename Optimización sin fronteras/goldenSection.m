%goldenSection
%       matriz = goldenSection(funcion, intervalo,  iterMax, tolerancia=1e-7)
%
%       Parámetros entrada
%            funcion= función anónima
%            intervalo = intervalo a evaluar
%            iterMax = numero de iteraciones maximas
%            tolerancia = tolerancia deseada
%
%
%        Parámetros salida
%             matriz = matriz solución con los el número de iteraciones, valores a-b,
%                                valores de la funcion evaluada en x1 y x2.

function matriz = goldenSection(funcion, intervalo,  iterMax, tolerancia=1e-7)
  radioDorado = (3 - sqrt(5))/2;
  a = intervalo(1);
  b = intervalo(2);
  x1 = a*(1-radioDorado) + b*radioDorado;
  x2 = a*radioDorado + b*(1 - radioDorado);
  fx1 = funcion(x1);
  fx2 = funcion(x2);
  matriz(1, 1:5)= [1, a , b, fx1, fx2];
  iteraciones = 1;
  while iteraciones <= iterMax
    iteraciones = iteraciones + 1;
    if fx1 > fx2
      a = x1;
      x1 = x2;
      fx1 = fx2;
      x2 = a*radioDorado + (1-radioDorado)*b;
      fx2 = funcion(x2);
    else
      b = x2;
      x2 = x1;
      fx2 = fx1;
      x1 = b*radioDorado + (1-radioDorado)*a;
      fx1 = funcion(x1);
    endif
    matriz(iteraciones, 1:end) = [iteraciones, a, b, funcion(x1), funcion(x2)];
    if abs(funcion(x1) - funcion(x2)) < tolerancia
      return
    endif
  endwhile
  msgID = 'Golden Section:numero iteraciones';
  msg = "Se excedio el numero de iteraciones, posiblemente el método diverge'";
  error(msgID,msg)
  endfunction