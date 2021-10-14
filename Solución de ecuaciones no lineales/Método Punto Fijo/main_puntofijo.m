%Problema 1 
%Problema 1: Se busca la distancia que tiene que estar un receptor de seÒal de una antena para
% que esta sea maxÌma cuya ecuaciÛn est· dada por:
syms x
fprintf("Problema 1 \n")
f = @(x) 2*exp(x)-x-10;
g = @(x) 2*exp(x)-10;
a = -20;
b = 0;
c = -5;
i = 5;
r = Puntofijo(g,i,c)
figura1 = figure(1);
t = a:0.1:b;
plot(t,f(t), 'b-', "linewidth", 1)
hold on;
grid on;
lineaCero = 0.*ones(length(t));
plot(t, lineaCero, 'k-', "linewidth", 1);
Fa = double(subs(f, x, a));
Fb = double(subs(f, x, b));
yIntervalo =Fa: (Fb-Fa)/i: Fb;
plot(r.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);



%Problema 2
%Problema 2: Se busca la potencia necesaria de una antena para dar seÒal a toda una ciuda
%en funciÛn de la corriente que le llega cuya ecuaciÛn esta dada por:
fprintf("\n\nProblema 2 \n")
f2 = @(x) 2*x.^2-4.*x-1;
g2 = @(x) sqrt((1+4*x)/2);
a2 = 0;
b2 = 3;
c2 = 2;
i2 = 10;
r2 = Puntofijo(g2,i2,c2)
figura2 = figure(2);
t2 = a2:0.1:b2;
plot(t2,f2(t2), 'g-', "linewidth", 1)
hold on;
grid on;
lineaCero = 0.*ones(length(t2));
plot(t2, lineaCero, 'k-', "linewidth", 1);
Fa = double(subs(f2, x, a2));
Fb = double(subs(f2, x, b2));
yIntervalo =Fa: (Fb-Fa)/i: Fb;
plot(r2.*ones(length(yIntervalo)), yIntervalo, 'r-', "linewidth", 1);




