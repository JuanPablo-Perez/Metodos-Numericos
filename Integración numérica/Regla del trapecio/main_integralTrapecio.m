

funcion  = @(x)0.2 + 25*x -200*x.^2 + 675*x.^3 -900*x.^4 + 400*x.^5;
intervalo = [0, 0.8];
n = 10;
[valor, error, datosGrafica] = integralTrapecio(funcion, intervalo, n);
disp('El valor aproximado de la integral es:')
disp(valor)
disp('El error estimado es:')
disp(error)
figura1 = figure(1);
t = linspace(intervalo(1), intervalo(2), 100);
fa  = funcion(intervalo(1));
fb = funcion(intervalo(2));
X = datosGrafica(:, 1)';
Y= datosGrafica(:, 2)';

hold on 
grid on
surf([X;X],  [Y; 0*Y], 0*[X; X]);
plot(t, funcion(t), 'r');
view(0, 90) ;
