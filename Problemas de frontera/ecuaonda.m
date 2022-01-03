% ecuaonda
%       [U] = ecuaonda(f,g,a,b,c,n,m);
%        Parámetro entrada
%               f = ecuación diferencial 
%               g = ecuación diferencial 
%               a = intervalo superior de x
%               b = ondición superior de t
%               c = extremo de la función
%               n = Número de filas de la matriz solución 
%               m = Número de columnas de la matriz solución
%        Parámetros salida
%               U = Aproximaciones a las distintas soluciones
function [U] = ecuaonda(f,g,a,b,c,n,m);
  
  h = a/(n-1);
  k = b/(m-1);
  r = c*k/h;
 %fórmula recursiva
  r1 = r^2;
  r2 = r^2/2;
  s1 = 1 - r^2;
  s2 = 2 - 2*r^2;
 %Matriz para almacenar la solución
  U = zeros(n,m);
  
 %*************************************************
  % Cálculo de aproximaciones
  
  
  for i=2:n-1
    %Aproximaciones de la primera fila
    U(i,1) = f(h*(i-1));
    
    %Aproximaciones de la segunda fila 
    U(i,2) = s1*f(h*(i-1))+k*g(h*(i-1))+r2*(f(h*i)+f(h*(i-2)));
  endfor
  
  %Aproximaciones a partir de la segunda fila
  for j=3:m
    for i=2:(n-1)
      U(i,j) = s2*U(i,j-1)+r1*(U(i-1,j-1)+U(i+1,j-1))-U(i,j-2);
    endfor
  endfor
  U = U';