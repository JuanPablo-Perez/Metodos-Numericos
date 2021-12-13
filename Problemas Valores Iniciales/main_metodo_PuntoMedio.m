clc
clear
pkg load symbolic

funcion = @(x, y) -(x.^2).*y;
intervalo = [0 ,2];
condicionInicial = 2;
iteraciones = 10;
[ecuacion, datos] = metodo_PuntoMedio(funcion, intervalo, condicionInicial, iteraciones)
disp('La ecuacion es:')
disp(ecuacion)
disp('Los resultados son:')
disp("X - Y - Error")
disp(datos)

t = linspace(intervalo(1), intervalo(2), 100);
plot(t, ecuacion(t), "-r")