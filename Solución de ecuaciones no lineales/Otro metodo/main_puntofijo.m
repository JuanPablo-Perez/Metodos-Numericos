%Problema 1 
%Se busca la potencia de una antena
%La funcion esta dada por
fprintf("Problema 1 \n")
f = @(x) x-exp(-x);
g = @(x) exp(-x);
a = -2;
b = 3;
c = 1;
i = 15;
r = Puntofijo(g,i,c)
figura1 = figure(1);
t = a:0.1:b
plot(t,f(t), 'g-', "linewidth", 1)
hold on;
grid on;
lineaCero = 0.*ones(length(t));
plot(t, lineaCero, 'k-', "linewidth", 1);



%Problema 2
%Se busca la ditancia a la que se recibe mayor señal de una antena
%La funcion esta dada por
fprintf("\n\nProblema 2 \n")
f2 = @(x) x.^2-3.*x-3;
g2 = @(x) sqrt(3+3*x);
a2 = 0;
b2 = 5;
c2 = 3;
i2 = 13;
r2 = Puntofijo(g2,i2,c2)
figura2 = figure(2);
t2 = a2:0.1:b2
plot(t2,f2(t2), 'b-', "linewidth", 1)
hold on;
grid on;
lineaCero = 0.*ones(length(t2));
plot(t2, lineaCero, 'k-', "linewidth", 1);

