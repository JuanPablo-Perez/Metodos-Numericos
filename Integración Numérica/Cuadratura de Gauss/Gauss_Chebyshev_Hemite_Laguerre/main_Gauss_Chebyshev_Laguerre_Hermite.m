clear 
clc
pkg load symbolic

disp('Gauss Chebyshev')
funcion = @(x)  (x.^4-5*x);
% La función debe ser de la forma f(x), tal que F(x) = f(x)*1/sqrt(1-x^2)
[valor, error] = gauss_Chebyshev(funcion, 20000)
disp('')
disp('')


disp('Gauss Laguerre')
funcion = @(x)  x.^2;
% La función debe ser de la forma f(x), tal que F(x) = f(x)*exp(-x)
n=5;
[valor] = gauss_Laguerre(funcion, n)
disp('')
disp('')


disp('Gauss Hermite')
funcion = @(x) 2*x.^2+5*x ;
% La función debe ser de la forma f(x), tal que F(x) = f(x)*exp(-x^2)
n=5;
[valor] = gauss_Hermite(funcion, n)