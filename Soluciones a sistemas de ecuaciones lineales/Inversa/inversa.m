%inversa
%       [inversa] = inversa(matriz)
%       Parámetros entrada
%            matriz = matriz cuadrada 
%        Parámetros salida
%             inversa = matriz inversa


function  [inversa]=  inversa(matriz);
  if size(matriz)(1) ~= size(matriz)(2);
    msgID = 'Inversa de una matriz: La matriz no es cuadrada';
    msg = 'La matriz de no es cuadrada';
    error(msgID,msg)
  endif
  identidad = eye(size(matriz));
  matriz = cat(2, matriz, identidad);
  nFilas = size(matriz)(1);
  inversa =[];
  for i=1:nFilas
    if matriz(i,i)~=1
      matriz(i,:)= matriz(i,:)./matriz(i,i); 
    endif
    for n=1:nFilas;
      if n~=i ;
          matriz(n,:)=-matriz(n,i).*matriz(i,:)+matriz(n,:); 
     end
    end 
  end
  inversa  = matriz(:, size(matriz)(2)/2 +1: size(matriz)(2));
  compronbacionInvertible = matriz(:, 1:size(matriz)(2)/2);
   if compronbacionInvertible ~= eye(size(compronbacionInvertible));
    msgID = 'Inversa de una matriz: La matriz no es invertible';
    msg = 'La matriz de no es invertible';
    error(msgID,msg)
  endif
end