function [ecuacion, datos] = metodo_PuntoMedio(funcion, intervalo, condicionInicial, iteraciones)
  h = (intervalo(2)-intervalo(1))/iteraciones;
  nuevoX = intervalo(1);
  nuevoY = condicionInicial
  datos(1, 1) = intervalo(1);
  datos(1, 2) = condicionInicial;
  for i = 1:iteraciones;
    k1 = h*funcion(nuevoX, nuevoY);
    k2 = h*funcion(nuevoX+h/2, nuevoY+k1/2);
    nuevoY = nuevoY+ k2;
    nuevoX= intervalo(1)+i*h;
    datos(i+1, 1) = nuevoX;
    datos(i+1, 2) = nuevoY;
  endfor
  [ecuacion, valor] = interpolacionLagrange(datos(:, 1), datos(:, 2),  condicionInicial);
  [solucionX, solucionY] = ode45(funcion, datos(:, 1), condicionInicial);

  for i = 1:size(solucionY);
    datos(i, 3) = abs(datos(i, 2) - solucionY(i))*100/solucionY(i);
  endfor
  
  endfunction