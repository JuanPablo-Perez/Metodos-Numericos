%Cholesky  
%       [L, solucion] = cholesky(matriz, b)
%
%       Parámetros entrada
%            matriz = matriz simétrica
%            b = matriz de términos independientes
%
%        Parámetros salida
%             L = matriz realizada la descomposición de Cholesky
%             solucion = vector solucion aplicado la descomposición de Cholesky

function  [L, solucion] = cholesky(matriz, b);
  if size(matriz)(1) ~= size(matriz)(2);
    msgID = 'Descomposición Cholesky: La matriz no es cuadrada';
    msg = 'La matriz no es cuadrada';
    error(msgID,msg)
  end
  valoresEiggen = eig(matriz);
  for i = 1:rank(matriz)
    if valoresEiggen(i) <= 0 
      msgID = 'Descomposición Cholesky: La matriz no es positiva';
      msg = 'La matriz no es positiva';
      error(msgID,msg)
    end
  end

  [n nn]=size(matriz);
  L = zeros(n,n);
  for k=1:n
    matriz(k,k)=sqrt(matriz(k,k));
    matriz(k+1:n,k)=matriz(k+1:n,k)/matriz(k,k);
    for j=k+1:n
        matriz(j:n,j)=matriz(j:n,j)-matriz(j,k)*matriz(j:n,k);
    end
  end
  L = matriz;
  for i = 1:n;
    for j = n:-1:1 ;
      if j == i
        break
      else
        L(i,j) = 0;
      endif
    endfor
  endfor
  Y = inversa(L)*b;
  solucion = inversa(L')*Y;
end