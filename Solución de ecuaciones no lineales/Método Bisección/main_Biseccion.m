% Método bisección

    % Problema 1
% Se busca encontrar la altura a la cual debemos colocar una antena
% La función objetivo está dada por:
syms x

a = 10;
b = 30;
n_iteraciones = 50;
ecuacion  = atan(x/pi)+x.^5/2-1.3*(10)^6;
[res1, datos1] = biseccion(ecuacion, [a, b], n_iteraciones);
disp(strcat("La raiz 1 es:", mat2str(res1)));

% Gráfico del problema 1
figura1 = figure(1);
intervalo = a:(b-a)/n_iteraciones:b-(b-a)/n_iteraciones;
funcion1= double(subs(ecuacion, x, intervalo));
plot(intervalo, funcion1, "linewidth", 4);
hold on;
grid on;
lineaCero = 0.*ones(length(intervalo));
plot(intervalo, lineaCero, 'k-', "linewidth", 1);
Fa = double(subs(ecuacion, x, a));
Fb =  double(subs(ecuacion, x, b));
yIntervalo =Fa: (Fb-Fa)/n_iteraciones: Fb;
plot(res1.*ones(length(yIntervalo)), yIntervalo, 'g-', "linewidth", 1);


% Problema 2
% Se busca  la distancia a la que un receptor de señal de radio se encuentra
% La función objetivo está dada por:
a = 1;
b = 2;
 n_iteraciones = 50;
ecuacion  = e^x+x-6;
[res2, datos2] = biseccion(ecuacion, [a, b], n_iteraciones);
disp(strcat("La raiz 2 es:", mat2str(res2)));

% Gráfico del problema 1
figura2 = figure(2);
intervalo = a:(b-a)/n_iteraciones:b-(b-a)/n_iteraciones;
funcion2= double(subs(ecuacion, x, intervalo));
plot( intervalo, funcion2, "linewidth", 4);
hold on;
grid on;
lineaCero = 0.*ones(length(intervalo));
plot( intervalo, lineaCero, 'k-', "linewidth", 1);
Fa = double(subs(ecuacion, x, a));
Fb =  double(subs(ecuacion, x, b));
yIntervalo =Fa: (Fb-Fa)/n_iteraciones: Fb;
plot( res2.*ones(length(yIntervalo)), yIntervalo, 'g-', "linewidth", 1);


% Resultados en general
disp(strcat("El problema 1 tiene raiz: " , mat2str(res1)));
disp(datos1)
disp(strcat("El problema 2 tiene raiz: ", mat2str(res2)));
disp(datos2)