                     % Problema 1 
%Se desea realizar el mantenimiento de una antena de señal,
%dicha antena se encuentra ubicada a una distancia x desde 
%lacentrar de los ingenieros que realizarán dicho mantenimiento.
%La distancia x esta dada por la siguiente ecuación.
%Encuntre que distancia tendrán que recorrer los de mantimiento
%para llegar a la antena.
syms x ;
funcion1   =   x .^3 + 4*(x.^2) - 10 ;
a =  1 ;
b =  2 ;
n_iteraciones =  5 ;
[res1, datos1] =  Secante(funcion1, [a, b], n_iteraciones);
disp ( strcat ( " La raiz 1 es: " , mat2str (res1))); 
% Gráfica Problema 1
intervaloX = linspace(a, b);
figura1 = figure(1);
plot(intervaloX, double(subs(funcion1, x, intervaloX)));
% Linea corte
grid on
hold on
Fa = double(subs(funcion1, x, a));
Fb = double(subs(funcion1, x, b));
intervaloY = linspace(Fa, Fb);
plot(res1.*ones(length(intervaloY)), intervaloY);
% Linea cero
plot(intervaloX, 0.*ones(length(intervaloX)))


                                % Problema 2
%Se desea saber en que punto se puede realizar la instalación de una 
%antena de señal, donde se puedan emitir las ondas electromagnéticas 
%y que la antena receptora trasmita dichas ondas electromagneticas en 
%señales electrícas variables, sin problema alguno.
%Se ha planteado una ecuación que parte desde la antena de recepción:
%Donde x representa la distancia la cual se tendra que poner la antena 
%de señal.Halle la distancia a la cual instalar la antena
a =  -3 ;
b =  -2 ;
n_iteraciones =  5 ;
ecuacion   =  x .^3 + x + 16 ;
[res2, datos2] =   Secante(ecuacion, [a, b], n_iteraciones);
disp ( strcat ( " La raiz 2 es: " , mat2str (res2)));
% Gráfica Problema 2
intervaloX = linspace(a, b);
figura2 = figure(2);
plot(intervaloX, double(subs(ecuacion, x, intervaloX)));
% Linea corte
grid on
hold on
Fa = double(subs(ecuacion, x, a));
Fb = double(subs(ecuacion, x, b));
intervaloY = linspace(Fa, Fb);
plot(res2.*ones(length(intervaloY)), intervaloY);
% Linea cero
plot(intervaloX, 0.*ones(length(intervaloX)))


%Resultados
disp ( strcat ( " El problema 1 tiene raiz: " , mat2str (res1)));
disp (datos1)
disp ( strcat ( " El problema 2 tiene raiz: " , mat2str (res2)));
disp (datos2)