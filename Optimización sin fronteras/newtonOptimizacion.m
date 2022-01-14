%newtonOptimizacion
%       [matriz, puntoCritico, f_puntoCritico] = newtonOptimizacion(funcion, puntoInicial, iterMax, tolerancia = 1e-7)
%
%       Parametros de entrada 
%           funcion = funcion a analizar
%           puntoInicial = Punto de inicio 
%           iterMax = Numero maximo de iteraciones 
%
%       Parametros de salida 
%           matriz = matriz con los resultados 
%           puntoCritico = punto critico de la funcion 
%           f_puntoCritico = funcion evaluada en el punto critico 


function [matriz, puntoCritico, f_puntoCritico] = newtonOptimizacion(funcion, puntoInicial, iterMax, tolerancia = 1e-7)
  syms x  y z;
  punto = puntoInicial;
  if length(puntoInicial) == 2
    punto = [punto, 0];
  endif
  funcionAnonima = @(t) double(subs(funcion, [x, y, z], t));
  n = length(puntoInicial);
  fAnterior = funcionAnonima(punto);
  iteraciones = -1;
  while iteraciones <= iterMax;
    iteraciones = iteraciones+1;
    gradiente = gradient(funcion, [x, y, z]);
    gradiente= gradiente;
    gradiente = double(subs(gradiente , [x, y, z], punto));
    matrizHessiana = hessianFuncion(funcion, punto);
    direccion_vector = (inverse(matrizHessiana)*gradiente)';
    fNueva = funcionAnonima(punto);
    gradienteNorma = norm(gradiente, 2);
    matriz(iteraciones+1, 1) = iteraciones;
    matriz(iteraciones+1, 2:1+length(punto)) = punto;
    matriz(iteraciones+1, 2+length(punto))  = funcionAnonima(punto);
    matriz(iteraciones+1, 3+length(punto))  = gradienteNorma;
    if gradienteNorma <tolerancia
      puntoCritico = punto;
      f_puntoCritico  = funcionAnonima(punto);
      return
    endif
    fAnterior = fNueva;
    punto  = punto - direccion_vector;
    
  endwhile
  msgID = 'Newton Optimizacion:numero iteraciones';
  msg = "Se excedio el numero de iteraciones, posiblemente el método diverge'";
  error(msgID,msg)
  
  
  endfunction
  
  
  endfunction
