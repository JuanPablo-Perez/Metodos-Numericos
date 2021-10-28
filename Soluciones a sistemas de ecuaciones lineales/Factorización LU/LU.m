%LU    (did�ctica).
%    LU(A,b) 
%       [L,U,x] =  LU(A, b)
%       Par�metros entrada
%            A = matriz cuadrada de coeficientes
%            b = matriz de t�rminos independientes
%        Par�metros salida
%            L =  matriz triangular inferior 
%            U =  matriz triangular superior
%            x = vector soluci�n de A


function [L,U,x] = LU(A,b)
   [n,n] = size(A);
   if n!= n
    msgID = 'Factorizaci�n LU: La matriz no es cuadrada';
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
  %Hallar  la soluci�n
  y = inv(L) * b;
  x = inv(U) * y;
  