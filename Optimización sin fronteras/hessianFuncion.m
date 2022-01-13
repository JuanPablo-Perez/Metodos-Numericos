function [matrizHessian] = hessianFuncion(funcion, punto_Inicio)
  syms x  y z;
  funcion_Anonima = @(t) double(subs(funcion, [x, y, z], t));
  deltaX = 0.001;
  tamano = length(punto_Inicio);
  matrizHessian = ones(tamano, tamano);
  matriz_terminos = [];
  for i =1:tamano
    for j = 1:tamano
      if i == j
        matriz_terminos = punto_Inicio;
        matriz_terminos(i) = punto_Inicio(i) + deltaX;
        termino1 = funcion_Anonima(matriz_terminos);
        matriz_terminos(i) = punto_Inicio(i) - deltaX;
        termino2 = funcion_Anonima(matriz_terminos);
        termino3 = funcion_Anonima(punto_Inicio);
        matrizHessian(i, j) = (termino1-2*termino3 +termino2) /(deltaX^2);
      else
        matriz_terminos = punto_Inicio;
        matriz_terminos(i) = punto_Inicio(i) + deltaX;
        matriz_terminos(j) = punto_Inicio(j) + deltaX;
        termino1 = funcion_Anonima(matriz_terminos);
        matriz_terminos = punto_Inicio;
        matriz_terminos(i) = punto_Inicio(i) + deltaX;
        matriz_terminos(j) = punto_Inicio(j) - deltaX;
        termino2 = funcion_Anonima(matriz_terminos);
        matriz_terminos = punto_Inicio;
        matriz_terminos(i) = punto_Inicio(i) - deltaX;
        matriz_terminos(j) = punto_Inicio(j) + deltaX;
        termino3 = funcion_Anonima(matriz_terminos);
        matriz_terminos = punto_Inicio;
        matriz_terminos(i) = punto_Inicio(i) - deltaX;
        matriz_terminos(j) = punto_Inicio(j) - deltaX;
        termino4 = funcion_Anonima(matriz_terminos);
        matrizHessian(i, j) = (termino1-termino2-termino3+termino4)/(4*deltaX^2);
      endif
    endfor
  endfor
  endfunction