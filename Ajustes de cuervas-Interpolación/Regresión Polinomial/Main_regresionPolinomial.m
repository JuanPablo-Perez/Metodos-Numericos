%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 08/11/2021
%Descripción : El programa tiene la finalidad de modelar
%              una relación no lineal entre las variables
%              independientes y dependientes usando la
%              regresion polinomial.


%                  Problema 1
% Encuentra la ecuación que más se ajuste a los puntos
% (0,2.1) ; (1, 7.7) ; (2, 13.6) ; (3, 27.2) ; (4,40.9)
%  (5, 61.1), con grado 2.
m =  2 ;
x = [ 0 , 1 , 2 , 3 , 4 , 5 ];
y = [ 2.1 , 7.7 , 13.6 , 27.2 , 40.9 , 61.1 ];
try
  ecuacion =  regresionPolinomial ( m , x , y );
  disp("PROBLEMA 1")
  disp("La ecuacion aproximada es:")
  disp(ecuacion)
  figura1 = figure(1);
  intervalo = min(x):(max(x)-min(x))/length(x):max(x);
  y1 = ecuacion(intervalo);
  plot(intervalo, y1, "linewidth", 4, 'g');
  hold on
  grid on
  plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end

%                   Problema 2
% Encuentra la ecuación que más se ajuste a los puntos
% (0,-1) ; (2, 0) ; (3, 2) ; (5,1) ;
% ,con grado 3.
m =  3 ;
x = [ 0 , 2 , 3 , 5];
y = [ -1 , 0 , 2 , 1];
try
  ecuacion =  regresionPolinomial ( m , x , y );
  disp("PROBLEMA 2")
  disp("La ecuacion aproximada es:")
  disp(ecuacion)
  figura2 = figure(2);
  intervalo = min(x):(max(x)-min(x))/length(x):max(x);
  y1 = ecuacion(intervalo);
  plot(intervalo, y1, "linewidth", 4, 'r');
  hold on
  grid on
  plot(x, y, ".*");
catch err
  fprintf('Error: %s\n',err.message)
end