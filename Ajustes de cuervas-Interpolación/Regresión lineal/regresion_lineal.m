%regresion_lineal
%       [recta, Sr ]= regresion_lineal(x, y)
%
%       Parámetros entrada
%            x = vector  de dimensión n 
%            y = vector de dimensión n 
%
%        Parámetros salida
%             recta = función que corresponde al ajuste de mínimos 
%                              cuadrados de los valores x y y
%             Sr = Suma de los cuadrados de los errores entre la y medida y la y calculada
function[recta,Sr] = regresion_lineal(X, Y)
if length(X) ~= length(Y)
  msgID = 'Ajuste por minimos cuadrados: las dimensiones de los vectores ingresados no coinciden';
  msg = "Las dimensiones de los vectores ingresados no coinciden'";
  error(msgID,msg)
endif
n = length(X);
sumxy = 0;
sumx2 = 0;
sumx = 0;
sumy = 0; 

for i = 1:n;
  sumxy = sumxy + X(i)*Y(i);
  sumx2 = sumx2  + (X(i))^2;
  sumx =  sumx + X(i);
  sumy = sumy + Y(i);
endfor
A = [n,sumx,sumy;sumx,sumx2,sumxy];
Ar = rref(A);
a0 = Ar(1,3)
a1 = Ar(2,3)
recta = @(x) a0+x*a1;

%Calculo del error
e = (Y-(a0+a1*X));
e2 = e.^2;
Sr = 0;
for i = 1:length(e);
  Sr = Sr + e2(i);
endfor 