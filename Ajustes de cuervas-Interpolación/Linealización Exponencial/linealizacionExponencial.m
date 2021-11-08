%linealizacionExponencial
%       [ecuacion] = linealizacionExponencial(x, y)
%
%       Parámetros entrada
%            x = vector  de dimensión n 
%            y = vector de dimensión n 
%
%        Parámetros salida
%             ecuacion= función que corresponde a la linealizacion 
%                                       exponencial  cuadrados de los valores x y y


function[ecuacion] = linealizacionExponencial(X, Y)
if length(X) ~= length(Y);
  msgID = 'Ajuste por minimos cuadrados: las dimensiones de los vectores ingresados no coinciden';
  msg = "Las dimensiones de los vectores ingresados no coinciden'";
  error(msgID,msg)
endif
n = length(X);
logx = [];
logy=[];
for i= 1:n;
  logx  = cat(1, logx, log10(X(i)));
  logy =  cat(1, logy, log10(Y(i)));
endfor
[recta, yCorte, pendiente]= minimosCuadrados(logx, logy);
m = pendiente
a = 10^(yCorte)
ecuacion = @(x) a*x.^(m);
endfunction