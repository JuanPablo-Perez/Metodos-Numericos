clc
clear
pkg load symbolic
syms x y z 
warning('off','all');


funcion = (x-4)^2+(y-3)^2 + 4*(z+5)^2
puntoInicio = [0, 0, 0];
iteraciones = 100;
[matriz, puntoMinimo, f_puntoMinimo] = newtonOptimizacion(funcion, puntoInicio, iteraciones)



sympref reset