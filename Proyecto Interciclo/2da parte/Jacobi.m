%Jacobi  
%       [x,k] = Jacobi(A,b,tolerancia,iteraciones,x0)
%
%       Parámetros entrada
%            A = matriz cuadrada de coeficientes
%            b = matriz de términos independientes
%            x0 =  primera aproximación de x
%            tolerancia = aproximación de error
%
%        Parámetros salida
%             x = vector solucion aplicado el Método de Jacobi
%             k = número de iteraciones realizadas

function [x,k] = Jacobi(A, b, tolerancia, iteraciones, x)

  [na, ma] = size(A);
  if na ~= ma
    msgID = 'Jacobi: la matriz de coedificientes debe ser cuadrada';
    msg = 'La matriz de coeficientes no es cuadrada';
    error(msgID,msg)
  endif

  [nb, mb] = size (b);
  if nb ~= na || mb~=1
    msgID = 'Jacobi: El vector solución debe contener las mismas filas que la matriz A';
    msg = 'El vector solución no tiene las mismas filas que la matriz A';
    error(msgID,msg)
  endif
  columna = zeros(na,1);
  for k=1: iteraciones
    Sumatoria = 0;
    for i=1:na
        columna(i) = b(i);
        for j=1:na
            columna(i) = columna(i) - A(i,j)*x(j); 
        endfor
        columna(i) = columna(i)/A(i,i);
        x(i) = x(i) + columna(i) ;
        if (columna(i) >= 0)
            Sumatoria = Sumatoria + columna(i);
        else 
            Sumatoria = Sumatoria - columna(i);
        endif
    endfor
    if(Sumatoria <= tolerancia)
        break
    endif
  endfor