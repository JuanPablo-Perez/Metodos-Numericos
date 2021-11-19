funcion  = @(x)0.2 + 25*x -200*x.^2 + 675*x.^3 -900*x.^4 + 400*x.^5;
intervalo = [0, 0.8];
[valor, error] = integralTrapecio(funcion, intervalo)

figura1 = figure(1);
t = linspace(intervalo(1), intervalo(2), 100);
fa  = funcion(intervalo(1));
fb = funcion(intervalo(2));
X = linspace(intervalo(1), intervalo(2), 100);
Y = linspace(fa, fb, 100);

plot(intervalo, [fa, fb], 'b-' )
surf([X; X], [Y(1,:); 0*Y(1,:)], 0*[zeros(size(X)); ones(size(X))])
hold on 
grid on
view(0, 90) ;
plot(t, funcion(t), 'r');


