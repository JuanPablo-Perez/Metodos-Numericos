%minimosCuadrados
%       [recta ]= minimosCuadrados(x, y)
%
%       Parámetros entrada
%            x = vector  de dimensión n 
%            y = vector de dimensión n 
%
%        Parámetros salida
%             recta = función que corresponde al ajuste de mínimos 
%                              cuadrados de los valores x y y


function[recta] = minimosCuadrados(X, Y)

if length(X) ~= length(Y)
  msgID = 'Ajuste por minimos cuadrados: las dimensiones de los vectores ingresados no coinciden';
  msg = "Las dimensiones de los vectores ingresados no coinciden'";
  error(msgID,msg)
endif
n = length(X);
sum1 = 0;
sum2 = 0;
sumx = 0;
sumy = 0; 

for i = 1:n;
  sum1 = sum1 + X(i)*Y(i);
  sum2 = sum2  + (X(i))^2;
  sumx =  sumx + X(i);
  sumy = sumy + Y(i);
endfor
xProm = sumx/n;
yProm = sumy/n;
m = ((n*sum1)-(sumx*sumy))/((n*sum2)-((sumx)^2))
a = yProm - m*xProm
recta = @(x)  a + m*x;
endfunction