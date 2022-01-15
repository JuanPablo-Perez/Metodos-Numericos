%gradienteConjugado
%       [matriz, puntoCritico, f_puntoCritico] = gradienteConjugado(funcion, puntoInicial, iterMax, tolerancia)
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
%            puntoMinimo = valor del punto crítico
%            f_puntoMinimo = Valor de la función evaluada en el punto crítico



function [matriz, puntoCritico, f_puntoCritico] = gradienteConjugado(funcion, puntoInicial, iterMax, tolerancia = 1e-7)
  syms x  y z;
  punto = puntoInicial;
  if length(puntoInicial) == 2
    punto = [punto, 0];
  endif
  funcionAnonima = @(t) double(subs(funcion, [x, y, z], t));
  n = length(puntoInicial);
  fAnterior = funcionAnonima(punto);
  gradienteAnterior = gradient(funcion, [x, y, z]);
  gradienteAnterior = double(subs(gradienteAnterior , [x, y, z], punto));  
  normaGradienteAnterior = norm(gradienteAnterior, 2);
  direccion_vectorAnterior = -gradienteAnterior;
  matrizGolden = goldenLine(funcionAnonima, [-100, 100], punto, direccion_vectorAnterior,  iterMax);
  fNueva = matrizGolden(2);
  alpha = matrizGolden(1);
  direccion_vectorAnterior=direccion_vectorAnterior';
  
  if normaGradienteAnterior < tolerancia
    puntoCritico  = punto;
    f_puntoCritico = funcionAnonima(punto);
    return
  endif
  matriz = [];
  matriz(1, 1) = 0;
  matriz(1, 2:1+length(punto)) = punto;
  matriz(1, 2+length(punto))  = funcionAnonima(punto);
  matriz(1, 3+length(punto))  = normaGradienteAnterior;
  
  punto = punto + alpha*direccion_vectorAnterior;
  iteraciones = 0;
  while iteraciones <= iterMax;
    iteraciones = iteraciones+1
    gradiente = gradient(funcion, [x, y, z]);
    gradiente = double(subs(gradiente , [x, y, z], punto));
    gradienteNorma = norm(gradiente, 2);
    matrizHessiana = hessianFuncion(funcion, punto);
    direccion_vectorAnterior = direccion_vectorAnterior';
    gradiente = gradiente';
    
    tamano_direccion_vectorAnterior = size(direccion_vectorAnterior);
    if tamano_direccion_vectorAnterior(2) ~= 1
      direccion_vectorAnterior = direccion_vectorAnterior';
    endif
    
    direccion_vector = -gradiente' + (gradiente*matrizHessiana*direccion_vectorAnterior)/(direccion_vectorAnterior' * matrizHessiana*direccion_vectorAnterior)    *  direccion_vectorAnterior;
    matrizGolden = goldenLine(funcionAnonima, [-100, 100], punto,direccion_vector,  iterMax);
    fNueva = matrizGolden(2);
    alpha = matrizGolden(1);
    
    matriz(iteraciones+1, 1) = iteraciones;
    matriz(iteraciones+1, 2:1+length(punto)) = punto;
    matriz(iteraciones+1, 2+length(punto))  = funcionAnonima(punto);
    matriz(iteraciones+1, 3+length(punto))  = gradienteNorma;
    
    if abs(fNueva - fAnterior) < tolerancia  | gradienteNorma  < tolerancia
      puntoCritico = punto;
      f_puntoCritico = funcionAnonima(punto);
      return
    endif
    
    gradienteAnterior = gradiente;
    direccion_vectorAnterior = direccion_vector;
    punto = punto+alpha*direccion_vector';
    fAnterior = funcionAnonima(punto);
    
    
  endwhile
  msgID = 'Gradiente Conjugado:numero iteraciones';
  msg = "Se excedio el numero de iteraciones, posiblemente el mÃ©todo diverge'";
  error(msgID,msg)
  
  
  endfunction