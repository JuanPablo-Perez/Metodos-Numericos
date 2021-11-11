 %regresionPolinomial
%       [ecuacion] = regresionPolinomial(orden,X,Y)
%
%       Parámetros entrada
%            X = vector  de dimensión n 
%            Y = vector de dimensión n 
%            orden = grado que tendrá la ecuacion.
%        Parámetros salida
%             ecuacion = función que corresponde a la regresión polinomial de 
%                       x,y y el orden.

 
 function  [ecuacion, valor] = interpolacionNewton(x, y,  xi)
   n = length(x);
   D = zeros(n,n);
   D(:, 1) = y;
  
   for j= 2:n
     for i = j:n
       D(i, j) = (D(i, j-1) - D(i-1, j-1))/(x(i)-x(i-j+1));
     endfor
   endfor
   C = D(n,n);
   for k=n-1:-1:1
     C = conv(C, poly(x(k)));
     m = length(C);
     C(m) = C(m)+D(k, k);
   endfor   
   ecuacion = poly2sym(C)
   valor = polyval(C, xi);
   X = linspace(min(x), max(x), 100);
   Y = polyval(C, X);
   plot(X, Y, "r");
   hold on
   plot(x, y, 'o')
 endfunction
