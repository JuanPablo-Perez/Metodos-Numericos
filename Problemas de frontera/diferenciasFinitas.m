% diferenciasFinitas
%       [ecuacion] = diferenciasFinitas(funcion, xFrontera1, yFrontera1, xFrontera2, yFrontera2, iteraciones);
%        Parámetro entrada
%               función = ecuacion diferencial simbólica
%               xFrontera1 = Condición inicial de x
%               xFrontera2 = Condición final de x
%               yFrontera1 = Confición inicial de y
%               yFrontera2 = Condición final de y
%               iteraciones = Número de iteraciones máximas 
%        Parámetros salida
%               ecuacion = Ecuación con los coeficientes resultates


function [ecuacion] = diferenciasFinitas(funcion, xFrontera1, yFrontera1, xFrontera2, yFrontera2, iteraciones);
  d2y_dx2 = sym("d2y_dx2");
  dy_dx = sym("dy_dx");
  y = sym("y");
  x = sym("x");
  deltaX = (xFrontera2 - xFrontera1)/iteraciones;
  valoresX = [xFrontera1];
  for i = 1:iteraciones
    valoresX = cat(1, valoresX, i*deltaX);
  endfor
  eeddMatriz = [];
  matriz = [];
  for i = 1:iteraciones-1
    menorY = sym(strcat("y", num2str(i-1)));
    if menorY == sym("y0")
      menorY = yFrontera1;
    endif
    mayorY = sym(strcat("y", num2str(i+1)));
    if mayorY == sym(strcat("y", num2str(iteraciones)))
      mayorY = yFrontera2;
    endif
    actualY = sym(strcat("y", num2str(i)));
    dy_dx_Nuevo = (mayorY-menorY)/deltaX;
    d2y_dx2_Nuevo = (menorY-2*actualY+mayorY)/deltaX^2;
    nuevaEcuacion = subs(funcion, [x, y, dy_dx, d2y_dx2], [valoresX(i+1), actualY, dy_dx_Nuevo, d2y_dx2_Nuevo])
    coeficientes = coeffs(nuevaEcuacion, [mayorY, actualY, menorY]);
    coeficientes = double(coeficientes);
    coeficientes = flip(coeficientes);
    
    if menorY == yFrontera1 || mayorY == yFrontera2
      adelantado = coeficientes(2);
      atrasado = coeficientes(1);
      if menorY == yFrontera1
        coeficientes = [adelantado, atrasado, coeficientes(3)];
      else
        coeficientes = [adelantado, atrasado, coeficientes(3)];
      endif
    endif
    coeficientes = [zeros([1, i-2]), coeficientes];
    coefDependiente = coeficientes(:, end);
    coeficientes = coeficientes(1:end, 1:end-1);
    coeficientes = [coeficientes, zeros([1, iteraciones-1-length(coeficientes)])];
    nuevoRenglon = [coeficientes, coefDependiente];
    matriz = cat(1, matriz, nuevoRenglon);

  endfor
  [matriz, puntos] = gauss_jordan(matriz(:, 1:end-1),matriz(:, end)) ;
  valoresY = [yFrontera1, puntos', yFrontera2];
  [ecuacion, valor] = interpolacionLagrange(valoresX, valoresY,  yFrontera1);
  
  endfunction