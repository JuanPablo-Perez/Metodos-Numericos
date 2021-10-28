%LU    (didáctica).
%    LU(A,b) 
%       [L,U,x] =  LU(A, b)
%       Parámetros entrada
%            A = matriz cuadrada de coeficientes
%            b = matriz de términos independientes
%        Parámetros salida
%            L =  matriz triangular inferior 
%            U =  matriz triangular superior
%            x = vector solución de A


function [L,U,x] = LU(A,b)
   [n,n] = size(A);
   if n!= n
    msgID = 'Factorización LU: La matriz no es cuadrada';
    msg = 'La matriz no es cuadrada';
    error(msgID,msg)
  endif
  for k =1:n
    L(k,k) = 1;
    for i = k+1:n
      L(i,k) = A(i,k) / A(k,k);
      for j = k+1:n
        A(i,j) = A(i,j)-L(i,k)*A(k,j);
      endfor
    endfor
    for j = k:n
      U(k,j) = A(k,j);
    endfor
    
  endfor
  %Hallar  la solución
  y = inv(L) * b;
  x = inv(U) * y;
  