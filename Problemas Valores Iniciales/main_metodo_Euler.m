 
 
clc
clear
pkg load symbolic
warning('off','all')
 
 funcion = @(x) -2*x.^3+12*x.^2-20*x+8.5;
 intervalo = [0 , 4];
 condicionInicial = 1;
 iteraciones = 100;
 
 [valor, error, estabilidad] = metodo_Euler(funcion, intervalo, condicionInicial, iteraciones, 3)