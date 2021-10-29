%Cholesky  
%       [L, solucion] = cholesky(matriz, b)
%
%       Parámetros entrada
%            A = matriz cuadrada de coeficientes
%            b = matriz de términos independientes
%            x0 =  primera aproximación de x
%            tol = tolerancia 
%
%        Parámetros salida
%             solucion = vector solucion aplicado la descomposición de Cholesky
%             iteracion = número de iteraciones realizadas



function [solucion, iteracion] = gauss_seidel(A,b,tol=0.0001)

[n, m] = size(A);
x0 = rand(1, n);
if n ~= m
  msgID = 'Gauss-Seidel: la matriz de coedificientes debe ser cuadrada';
  msg = 'La matriz de coeficientes no es cuadrada';
  error(msgID,msg)
end

D = diag(diag(A));
M = tril(A);
P = triu(A);
L = M- D;
U = P- D;

solucion(:,1) = x0;
err = rand(1, n);
error= 100000000*err;
zerosError = zeros(n,1);
iteracion= 1;

%  Método iterativo de Gauss-Seidel
while sum(abs(error) >= tol) ~= zerosError;
    solucion(:,iteracion+1) = -inversa(D+L)*(U)*solucion(:,iteracion) + inversa(D+L)*b;
    error= solucion(:,iteracion+1) - solucion(:, iteracion);
    iteracion= iteracion + 1;
end
solucion = solucion(:,end);
endfunction
