%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 18/10/2021
%Descripción :Este programa encuentra las raices de ecuaciones no lineales por el método de punto fijo 

%Problema 1: Se busca la distancia que tiene que estar un receptor de señal de una antena para
% que esta sea maxíma cuya ecuación está dada por:
fprintf("Problema 1 \n")
f = @(x) 2*exp(x)-x-10;
g = @(x) 2*exp(x)-10;
a = -20;
b = 0;
c = -5;
i = 5;

try 
  [r,datos,n] = Puntofijo(f,g,a,b,c);
formatSpec = 'El valor de corte es %4.6f, el número de iteraciones es %1.0f\n';
fprintf(formatSpec,r,n)

  [m,o] = size(datos);
  fprintf('Interación\ta\tb\txi\txi+1\tf(xi+1)\terror\n');
  for i=1:m
    fprintf('%d\t\t',i);
    for j=1:o
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor

   %Gráfica del problema 1 
  figura1 = figure(1);
  t = a:0.1:b;
  plot(t,f(t), 'b-', "linewidth", 1)
  hold on;
  grid on;
  %Línea x = 0
  lineaCero = 0.*ones(length(t));
  plot(t, lineaCero, 'k-', "linewidth", 1);
  %Línea de corte
  Fa = f(a);
  Fb = f(b);
  yIntervalo = Fa: (Fb-Fa)/i: Fb;
  plot(r.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);
  
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end 


%Problema 2
%Problema 2: Se busca la potencia necesaria de una antena para dar señal a toda una ciuda
%en función de la corriente que le llega cuya ecuación esta dada por:
fprintf("\n\nProblema 2 \n")
f = @(x) 2*x.^2-4.*x-1;
g = @(x) sqrt((1+4*x)/2);
a = 0;
b = 3;
c = 2;
i = 10;
try 
  [r,datos,n] = Puntofijo(f,g,a,b,c);
  formatSpec = 'El valor de corte es %4.6f, el número de iteraciones es %1.0f\n';
  fprintf(formatSpec,r,n)

   [m,o] = size(datos);
    fprintf('Interación\ta\tb\txi\txi+1\tf(xi+1)\terror\n');
   for i=1:m
      fprintf('%d\t\t',i);
      for j=1:o
        fprintf('%d\t',datos(i,j));
      endfor
      fprintf('\n');
   endfor

  %Gráfico problema 2
  figura2 = figure(2);
  t = a:0.1:b;
  plot(t,f(t), 'g-', "linewidth", 1)
  hold on;
  grid on;
  %Línea x = 0
  lineaCero = 0.*ones(length(t));
  plot(t, lineaCero, 'k-', "linewidth", 1);
  %Línea de corte
  Fa = f(a);
  Fb = f(b);
  yIntervalo =Fa: (Fb-Fa)/i: Fb;
  plot(r.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);
  
catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
  end




