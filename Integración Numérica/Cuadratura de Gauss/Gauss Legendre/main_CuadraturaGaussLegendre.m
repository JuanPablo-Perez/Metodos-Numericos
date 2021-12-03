%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 2/12/2021
%Descripción : El programa tiene la finalidad de calcular
%              la integral de una función mediante la cuadratura 
%              de Gauss Legendre de 2 y 3 puntos.

clear
clc
disp ("Problema 1")

%                             Problema 1
% Utilizar la regla de cuadraturas de gauss con 2 puntos para obtener una 
%aproximación de la integral definida siguiente f(x)= e^x(sen(x))/1+x^2, 
%la integral se evaluará en el intervalo[0,3].

try
  funcion= @(x) exp(x).*sin(x)./(1+x.^2);
  intervalo = [0, 3];
  [valor, error, datosGrafica] = gaussLegendre_2Puntos(funcion, intervalo);
  disp('El valor aproximado de la integral es:')
  disp(valor)
  disp('El error estimado es:')
  disp(error)
  figura1 = figure(1);
  X = datosGrafica(1,:);
  Y= datosGrafica(2, :);
  hold on 
  grid on
  surf([X;X],  [Y; 0*Y], 0*[X; X]);
  view(0, 90) ;
catch err
  fprintf('Error: %s\n',err.message)
end




disp("")
disp ("Problema 2")
%                             Problema 2
% Utilizar la regla de cuadraturas de gauss con 3 puntos para obtener una 
%aproximación de la integral definida siguiente f(x)= 0.2+25x-200x^2+675x^3-900x^4
%+ 400*x.^5, la integral se evaluará en el intervalo[0,0.8].

try
  funcion= @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
  intervalo = [1, 2];
  [valor, error, datosGrafica] = gaussLegendre_3Puntos(funcion, intervalo);
  disp('El valor aproximado de la integral es:')
  disp(valor)
  disp('El error estimado es:')
  disp(error)
  figura2 = figure(2);
  X = datosGrafica(1,:);
  Y= datosGrafica(2, :);
  hold on 
  grid on
  surf([X;X],  [Y; 0*Y], 0*[X; X]);
  view(0, 90) ;
catch err
  fprintf('Error: %s\n',err.message)
end