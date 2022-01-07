%interpolacionCuadratica
%       [matriz, puntoCritico, f_puntoCritico] = interpolacionCuadratica(funcion, intervalo,  iterMax, tolerancia=1e-7)
%
%       Parámetros entrada
%            funcion= función anónima
%            intervalo = intervalo a evaluar
%            iterMax = numero de iteraciones maximas
%            tolerancia = tolerancia deseada
%
%
%        Parámetros salida
%             matriz = matriz solución con los el número de iteraciones, valores x1-x2-x3,
%                                valores de la funcion evaluada en x1,x2, x3
%             puntoCritico = valor del punto critico
%             f_puntoCritico = valor de la funcion evaluada en el punto critico



function [matriz, puntoCritico, f_puntoCritico] = interpolacionCuadratica(funcion, intervalo,  iterMax, tolerancia=1e-7)
  if intervalo(1) >= intervalo(2)
    msgID = 'Interpolacion Cuadratica:intervalos';
    msg = "El intervalo especificado no es  correcto. 'El primer termino debe ser menor al segundo";
    error(msgID,msg)
  endif
  x1 = intervalo(1);
  x3 = intervalo(2);
  x2 = (x1+x3)/2;
  
  f1 = funcion(x1);
  f2 = funcion(x2);
  f3 = funcion(x3);
  z1 = (x2 - x3)*f1;
  z2 = (x3 - x1)*f2;
  z3 = (x1 - x2)*f3;
  z4 = (x2+x3)*z1 + (x1+x3)*z2 + (x1+x2)*z3;
  xValor0 = 1e100;
  xValor = z4/(2*(z1+z2+z3));
  yValor = funcion(xValor);
  matriz(1, 1:7)= [1, x1 , x2, x3,  f1, f2, f3];
  iteraciones = 1;
  while iteraciones <= iterMax
    iteraciones = iteraciones + 1;
    if (x1 < xValor) & (xValor < x2)
      if (yValor <= f2)
        x3 = x2;
        f3 = f2;
        x2 = xValor;
        f2 = yValor;
      else
        x1 = xValor;
        f1 = yValor;
      endif
    else
      if (x2  < xValor)  &  (xValor < x3)
        if (yValor <= f2)
          x1= x2;
          f1 = f2;
          x2 = xValor;
          f2 = yValor;
        else
          x3 = xValor;
          f3 = yValor;
        endif
      endif
    endif
    xValor0 = xValor;
    z1 = (x2- x3)*f1;
    z2 = (x3- x1)*f2;
    z3 = (x1- x2)*f3;
    z4 = (x2+ x3)*z1 + (x3 + x1)*z2 + (x1 + x2)*z3;
    xValor = z4/(2*(z1+z2+z3));
    yValor = funcion(xValor);
    matriz(iteraciones, 1:end) = [iteraciones, x1, x2, x3, f1, f2, f3 ];
    if abs(xValor0-xValor) < tolerancia
      puntoCritico  = xValor;
      f_puntoCritico = funcion(xValor);
      return
    endif
  endwhile
  msgID = 'Interpolacion Cuadratica:numero iteraciones';
  msg = "Se excedio el numero de iteraciones, posiblemente el método diverge'";
  error(msgID,msg)
  
  endfunction