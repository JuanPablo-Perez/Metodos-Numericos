clc 
clear
format long
pkg load symbolic
warning('off','all');

iteracionesMax = 100;
tolerancia = 0.0001;

% Problema 1
disp('Problema 1 ...')
primer_Problema(iteracionesMax = iteracionesMax, tolerancia = tolerancia)
crearEsparciado('Problema 1')


% Problema 2
disp('Problema 2 ...')
segundo_Problema(iteracionesMax = iteracionesMax, tolerancia = tolerancia)
crearEsparciado('Problema 2')


% Problema 3
disp('Problema 3 ...')
sol1 = tercer_Problema_1(iteracionesMax = iteracionesMax, tolerancia = tolerancia);
sol2 = tercer_Problema_2(iteracionesMax = iteracionesMax, tolerancia = tolerancia);
solucion  = [sol1, sol2]
crearEsparciado('Problema 3')


% Problema 4
disp('Problema 4...')
cuarto_Problema(iteracionesMax = iteracionesMax, tolerancia = tolerancia)
crearEsparciado('Problema 4')


function crearEsparciado(problema);
  disp(strcat('Fin ' , problema, '.'))
  disp('')
  disp('* * * * * * * ')
  disp('')
  end
  
