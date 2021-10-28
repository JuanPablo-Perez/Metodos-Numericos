  
  
  %                  Problema 1
%Halle el potencial en a,b, c, si luego de realizar el análisis
%nodal tenemos el siguiente sistema de ecuaciones:
%      6a   +     15b  +   55c     = 5;
%    15a   +    55b  +   225c  =  12; 
%    55a   +  225b  +  979c  = 56;  
%     5a   +     0   +   2c   -  8d  = 300 
A = [6, 15, 55; 15, 55, 225; 55, 225, 979];
b = [5; 12; 56];
disp("PROBLEMA 1")
try
  [L, solucion] = cholesky(A, b);
  disp('La matriz resultado de la descomposicion de Cholesky es:')
  disp(L)
  disp("El vector solucion es: ")
  disp(solucion)
catch err
  fprintf('Error: %s\n',err.message);
end




%                   Problema 2
% Encuentre las corrientes i1, i2, i3. Si luego de realizar el 
% análisis obtenemos el sistema de ecuaciones:
%   1i1   +     0      +    2i3    +    i4      =   8
%    0     +   3i2    +      0      +    0       =  45
%   2i1    +    0      +    4i3   +   2i4    =  18
%      i1    +    0      +    2i3   +    i4       = 12

A = [8,20,15; 20, 80, 50; 15, 50, 60];
b = [50;250;100];
disp('')
disp("PROBLEMA 2")

try
  [L, solucion] = cholesky(A, b);
  disp('La matriz resultado de la descomposicion de Cholesky es:')
  disp(L)
  disp("El vector solucion es: ")
  disp(solucion)
catch err
  fprintf('Error: %s\n',err.message);
end


