clc 
clear
format long
pkg load symbolic
warning('off','all');

function crearEspaciado(problema);
  disp(strcat('Fin ' , problema, '.'))
  disp('')
  disp('* * * * * * * ')
  disp('')
end


iteracionesMax = 100;
tolerancia = 0.0001;

% Problema 1
disp('Problema 1 ...')
Problema_1(iteraciones = iteracionesMax, tolerancia = tolerancia)
crearEspaciado('Problema 1')


% Problema 2
disp('Problema 2 ...')
Problema_2(iteraciones = iteracionesMax, tolerancia = tolerancia)
crearEspaciado('Problema 2')


% Problema 3
disp('Problema 3 ...')
Problema_3(iteraciones = iteracionesMax, tolerancia = tolerancia)
crearEspaciado('Problema 3')


% Problema 4
disp('Problema 4...')
Problema_4(iteraciones = iteracionesMax, tolerancia = tolerancia)
crearEspaciado('Problema 4')