function [ecuacion, datos] = metodo_Runge_Kutta(funcion, intervalo, condicionInicial, iteraciones, orden)
  h = (intervalo(2)-intervalo(1))/iteraciones;
  nuevoX = intervalo(1);
  nuevoY = condicionInicial;
  datos(1, 1) = intervalo(1);
  datos(1, 2) = condicionInicial;
  
  for i = 1:iteraciones;
    k1 = funcion(nuevoX, nuevoY);
  
  if orden == 2;
    k2 = funcion(nuevoX+h*3/4, nuevoY+k1*h*3/4);
    nuevoY = nuevoY+ ((1/3)*k1+(2/3)*k2)*h;
    
  elseif orden == 3;
    k2 = funcion(nuevoX + h/2, nuevoY + k1*h/2);
    k3 = funcion(nuevoX+h, nuevoY-k1*h+2*k2*h);
    nuevoY = nuevoY+ (1/6)*(k1+4*k2+k3)*h;
  endif
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