%steepestDescent
%       [matriz, puntoMinimo, f_puntoMinimo] = steepestDescent(funcion, puntoInicial, iterMax, tolerancia)
%
%       Parámetros de entrada
%            funcion = función anónima
%            puntoInicial = punto para la primera iteración
%            iterMax = numero de iteraciones maximas
%            tolerancia = tolerancia deseada
%
%
%        Parámetros salida
%            matriz = matriz solución con las iteraciones realizadas
%            puntoMinimo = valor del punto mínimo
%            f_puntoMinimo = Valor de la función evaluada en el punto mínimo


function  [matriz, puntoMinimo, f_puntoMinimo] = steepestDescent(funcion, puntoInicial, iterMax, tolerancia = 1e-7)
  syms x  y z;
  punto = puntoInicial;
  if length(puntoInicial) == 2
    punto = [punto, 0];
  endif
  funcionAnonima = @(t) double(subs(funcion, [x, y, z], t));
  fAnterior = funcionAnonima(punto);
  iteraciones = -1;
  while iteraciones <= iterMax;
    iteraciones = iteraciones+1;
    gradiente = gradient(funcion, [x, y, z]);
    direccion_vector = -gradiente;
    direccion_vector = double(subs(direccion_vector, [x, y, z], punto));
    golden = goldenLine(funcionAnonima, [-100, 100], punto, direccion_vector, iterMax, tolerancia);
    fNueva= golden(2);
    alpha = golden(1);
    matriz(iteraciones+1, 1) = iteraciones;
    matriz(iteraciones+1, 2:1+length(punto)) = punto;
    matriz(iteraciones+1, 2+length(punto))  = funcionAnonima(punto);
    matriz(iteraciones+1, 3+length(punto))  = norm(direccion_vector);
    if abs(fNueva - fAnterior) < tolerancia | norm(gradiente, 2) < tolerancia
      puntoMinimo = punto;
      f_puntoMinimo = funcionAnonima(punto);
      if length(puntoInicial) == 2
        puntoMinimo = punto(1:end-1);
      endif
      return
    endif
    gradienteNorma = norm(gradiente, 2);
    fAnterior = fNueva;
    punto = punto + (alpha*direccion_vector)';
  endwhile
  msgID = 'Steepest descent:numero iteraciones';
  msg = "Se excedio el numero de iteraciones, posiblemente el método diverge'";
  error(msgID,msg)
  
  endfunction