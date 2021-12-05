%gauss_Laguerre
%       [valor] = gauss_Laguerre(funcion, n)
%
%       Parámetros entrada
%            funcion= función anónima de la forma f(x), tal que F(x) = f(x)*exp(-x)
%            n = número de puntos base
%
%        Parámetros salida
%             valor = valor aproximado de la integral



function [valor] = gauss_Laguerre(funcion, n)
nodosPeso = [
0.585786, 3.414214,0.853554 , 0.146447, 0, 0, 0,0, 0, 0, 0, 0 ;
0.415775, 2.294280 , 6.289945, 0.711093, 0.278517, 0.103892e-1, 0, 0, 0, 0, 0,0 ;
0.322548, 1.745761, 4.536620, 9.395071, 0.603154, 0.357418, 0.3887912e-1, 0.539295e-3 , 0, 0, 0, 0;
0.263560, 1.413403, 3.596426, 7.085810, 12.640801, 0.521756, 0.398667, 0.759424e-1,  0.361175e-2,  0.233670e-4, 0, 0;
0.222847, 1.188932, 2.992736, 5.775144, 9.837467, 15.982874, 0.458964, 0.417000, 0.113373, 0.103992e-1, 0.261017e-3, 0.898548e-6 ];

nodosPeso = nodosPeso(n, 1:2*(n+1));
xi = nodosPeso(1:n+1);
Ai = nodosPeso(n+2:end);
valor = 0;
for i = 1:length(Ai)
  valor = valor + Ai(i)*funcion(xi(i));
endfor
endfunction
