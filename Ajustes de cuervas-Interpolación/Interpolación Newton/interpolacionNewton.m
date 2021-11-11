%       [ecuacion, valor,Y,X] = interpolacionNewton(x, y,  xi)
%
%       Parámetros entrada
%            x = vector  de dimensión n 
%            y = vector de dimensión n 
%            xi = valor en el que se desea aproximar la función
%        Parámetros salida
%             ecuacion = función que corresponde a la Interpolación polinomial  
%                       de Newton de x,y y el orden.
%             valor = resultado de la aproximación de xi
%             Y = valores de la función en y 
%             X = valores de la función en x 

 
 function  [ecuacion, valor,Y,X] = interpolacionNewton(x, y,  xi)
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
   ecuacion = poly2sym(C);
   valor = polyval(C, xi);
   X = linspace(min(x)-0.4, max(x)+0.4, 100);
   Y = polyval(C, X);

 endfunction
