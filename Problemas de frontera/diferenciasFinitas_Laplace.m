%diferenciasFinitas_Laplace
%       [matriz, iter]=diferenciasFinitas_Laplace(c1, c2, c3, c4, numFilas, numColumnas, iterMax=100, tolerancia=0.001)
%
%       Parámetros entrada
%            c1= contorno superior derecho
%            c2= contorno superior izquierdo
%            c3= contorno inferior derecho
%            c2= contorno inferior izquierdo
%            numFilas=numero de puntos horizontales
%            numFilas=numero de puntos verticales
%            iterMax = numero de iteraciones maximas
%            tolerancia = tolerancia deseada
%
%
%        Parámetros salida
%             matriz = matriz solución
%             iter = número de iteraciones realizadas
%

function [matriz, iter]=diferenciasFinitas_Laplace(c1, c2, c3, c4, numFilas, numColumnas, iterMax=100, tolerancia=0.001)
  matriz = [];
  # Lados horizontales
  for i=1:numFilas+2
    matriz(i,1)=c3;
    matriz(i,numColumnas+2)=c4;
  end
  # Lados verticales
  for j=1:numColumnas+2
    matriz(1,j)=c1;
    matriz(numFilas+2,j)=c2;
  end
  #Cálculo del promedio
  prom=(c1+c2+c3+c4)/4;
  for i=2:numFilas+1
    for j=2:numColumnas+1
      matriz(i,j)=prom;
      end 
  end
  iter = 0;
  conv=0;
  while iter<iterMax
    iter= iter+1;
    matrizVariable = matriz;
    for i=2:numFilas+1
      for j=2:numColumnas+1
        matriz(i,j)= (matriz(i-1, j) + matriz(i+1, j) + matriz(i, j+1) + matriz(i, j-1))/4;
      endfor
    endfor
    if norm(matriz-matrizVariable)/norm(matriz) < tolerancia
      return
    endif
  end
  msgID = 'Diferencias finitas Laplace:numero iteraciones';
  msg = "Se excedio el numero de iteraciones, posiblemente el método diverge'";
  error(msgID,msg)
end