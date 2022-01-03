% ecuaonda
%       [U] = ecuaonda(f,g,a,b,c,n,m);
%        Par�metro entrada
%               f = ecuaci�n diferencial 
%               g = ecuaci�n diferencial 
%               a = intervalo superior de x
%               b = ondici�n superior de t
%               c = extremo de la funci�n
%               n = N�mero de filas de la matriz soluci�n 
%               m = N�mero de columnas de la matriz soluci�n
%        Par�metros salida
%               U = Aproximaciones a las distintas soluciones
function [U] = ecuaonda(f,g,a,b,c,n,m);
  
  h = a/(n-1);
  k = b/(m-1);
  r = c*k/h;
 %f�rmula recursiva
  r1 = r^2;
  r2 = r^2/2;
  s1 = 1 - r^2;
  s2 = 2 - 2*r^2;
 %Matriz para almacenar la soluci�n
  U = zeros(n,m);
  
 %*************************************************
  % C�lculo de aproximaciones
  
  
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