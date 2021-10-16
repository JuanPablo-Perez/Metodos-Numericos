%Problema 1 
%Se busca la potencia de una antena cuya función  está dada por ls ecuación:
syms x
fprintf("Problema 1 \n")
f =  x-exp(-x);
a = -2;
b = 3;
c = 1;
datos="";


[r, datos, n]= Newton(f,a,b,c);
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
f2=function_handle(f);
plot(t,f2(t), 'g-', "linewidth", 1)
hold on;
grid on;
%Línea x = 0
lineaCero = 0.*ones(length(t));
plot(t, lineaCero, 'k-', "linewidth", 1);
%Línea de corte
Fa = double(subs(f, x, a));
Fb = double(subs(f, x, b));
yIntervalo =Fa: (Fb-Fa)/i: Fb;
plot(r.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);



%Problema 2
%Se busca la distancia a la que da mayor señal una antena cuya ecuación es:
fprintf("\n\nProblema 2 \n")
f =  x.^2-3.*x-3;
a = 0;
b = 5;
c = 3;
[r, datos, n]= Newton(f,a,b,c);
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

  


%Gráfica del problema 2
figura2 = figure(2);
t = a:0.1:b;
f2 = function_handle(f);
plot(t,f2(t), 'b-', "linewidth", 1)
hold on;
grid on;
%Línea x = 0
lineaCero = 0.*ones(length(t));
plot(t, lineaCero, 'k-', "linewidth", 1);
%Línea de corte
Fa = double(subs(f, x, a));
Fb = double(subs(f, x, b));
yIntervalo =Fa: (Fb-Fa)/i: Fb;
plot(r.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);
