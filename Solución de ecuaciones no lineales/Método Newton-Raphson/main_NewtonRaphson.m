%Problema 1 
%Se busca la potencia de una antena
%La funcion esta dada por
syms x
fprintf("Problema 1 \n")
f =  x-exp(-x);
a = -2;
b = 3;
c = 1;

% i nos indica el número de iteraciones
i = 3;

r = Newton(f,i,c);
figura1 = figure(1);
t = a:0.1:b;
f2=function_handle(f);
plot(t,f2(t), 'g-', "linewidth", 1)
hold on;
grid on;
lineaCero = 0.*ones(length(t));
plot(t, lineaCero, 'k-', "linewidth", 1);
Fa = double(subs(f, x, a));
Fb = double(subs(f, x, b));
yIntervalo =Fa: (Fb-Fa)/i: Fb;
plot(r.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);



%Problema 2
%Se busca la ditancia a la que se recibe mayor señal de una antena
%La funcion esta dada por
fprintf("\n\nProblema 2 \n")
f3 =  x.^2-3.*x-3;
a2 = 0;
b2 = 5;
c2 = 3;

% i2 nos indica el número de iteraciones
i2 = 3;

r2 = Newton(f3,i2,c2);
figura2 = figure(2);
t2 = a2:0.1:b2;
f4=function_handle(f3);
plot(t2,f4(t2), 'b-', "linewidth", 1)
hold on;
grid on;
lineaCero = 0.*ones(length(t2));
plot(t2, lineaCero, 'k-', "linewidth", 1);
Fa = double(subs(f3, x, a2));
Fb = double(subs(f3, x, b2));
yIntervalo =Fa: (Fb-Fa)/i: Fb;
plot(r2.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);