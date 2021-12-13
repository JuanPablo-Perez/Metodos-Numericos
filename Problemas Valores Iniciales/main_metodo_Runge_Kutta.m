clc
clear
pkg load symbolic


funcion = @(x) -2*x^3+12*x^2-20*x+8.5
condicionInicial = 1;
intervalo = [0, 4];
iteraciones = 8;
[ecuacion, datos] = metodo_Runge_Kutta(funcion, intervalo, condicionInicial, iteraciones, 2);
disp('La ecuacion es:')
disp(ecuacion)
disp('Los resultados son:')
disp("X - Y - Error")
disp(datos)
t = linspace(intervalo(1), intervalo(2), 100);
plot(t, ecuacion(t), "-r")