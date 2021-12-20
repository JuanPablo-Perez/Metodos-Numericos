warning('off', 'all')
d2y_dx2 = sym("d2y_dx2");
y = sym("y");
x = sym("x");
funcion = d2y_dx2 +4*y==8*cos(2*x);
xFrontera1 = 0;
yFrontera1 = 0;
xFrontera2 = 10;
yFrontera2 = -18.26
iteraciones = 5;
[ecuacion] = diferenciasFinitas(funcion, xFrontera1, yFrontera1, xFrontera2, yFrontera2, iteraciones);
disp('La ecuacion es:')
  disp(ecuacion)
  figura1= figure(1);
  t = linspace(xFrontera1, xFrontera2, 100);
  plot(t, ecuacion(t), "-r")
  
  hold on 
  grid on
  ecuacion = @(x)- 2.*x.*sin(2.*x);
  plot(t, ecuacion(t), '-b')
