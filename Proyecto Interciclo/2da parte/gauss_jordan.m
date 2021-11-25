%gauss_jordan
%       [matriz, solucion] = gauss_jordan(A,b) 
%       Par�metros entrada
%            A = matriz cuadrada de coeficientes
%            b = matriz de t�rminos independientes
%        Par�metros salida
%             matriz=  matriz A escalonada  y reducida
%             solucion = vector soluci�n de la matriz Ab


function [matriz, solucion] = gauss_jordan(A,b);
  if size(A)(1) ~= size(A)(2);
    msgID = 'Eliminiaci�n Gauss-Jordan: La matriz de coeficientes no es cuadrada';
    msg = 'La matriz de coeficientes no es cuadrada';
    error(msgID,msg)
  endif
  matriz=[A b];
  nFilas = size(matriz)(1);
  for i=1:nFilas
    if matriz(i,i)~=1
      matriz(i,:)= matriz(i,:)./matriz(i,i); 
    endif
    for n=1:nFilas;
      if n~=i ;
          matriz(n,:)=-matriz(n,i).*matriz(i,:)+matriz(n,:); 
      end
    end 
    solucion = matriz(:, nFilas+1);
  end
  
end