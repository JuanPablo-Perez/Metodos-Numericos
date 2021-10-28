%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 27/10/2021
%Descripción : El programa tiene la finalidad de resolver
%              ecuaciones  lineales por el método de 
%              Factorización LU. 

%                      Problema 1
%Halle el potencial en a,b,c,d si luego de realizar el análisis
%nodal tenemos el siguiente sistema de ecuaciones:
%-7a + 2b  + 0c   + 4d = -60 ;
%  a - 4b  + 2c   + 0d = -90 ;
% 0a - 5b  + 11c  - 2d =   0 ;
% 5a + 0b  + 2c   - 8d = 300 ;



disp("PROBLEMA 1")
A = [-7,2,0,4;1,-4,2,0;0,-5,11,-2;5,0,2,-8]
b = [-60;-90;0;300]

try
  [L,U,x] = LU(A, b);
  disp('La matriz triangular inferior es:')
  disp(L)
  disp ('La matriz triangular superior es:')
  disp(U)
  disp ('La solución es:')
  for i=1:length(x);
    textoResultado = strcat("x", mat2str(i), " = ", mat2str(x(i)));
    disp(textoResultado)
  endfor
catch err
  fprintf('Error: %s\n',err.message);
end





%                  Problema 2
%Encuentre las corrientes i1, i2, i3, i4. Si luego de realizar al
%análisis obtenemos el sistema de ecuaciones:
% 7i1 - 2i2 + 0i3 + 0i4 = 8        ;
%-2i1 + 6i2 - 4i3 + 0i4 = 4        ;
% 0i1 - 4i2 + 5i3 -  i4 = -10      ;
% 0i1 + 0i2 -  i3 + 5i4 = -4       ;


disp("PROBLEMA 2")
A2 = [7,-2,0,0;-2,6,-4,0;0,-4,5,-1;0,0,-1,5]
b2 = [8;4;-10;-4]

try
  [L,U,x] = LU(A2, b2);
  disp('La matriz triangular inferior es:')
  disp(L)
  disp ('La matriz triangular superior es:')
  disp(U)
  disp ('La solución es:')
  for i=1:length(x);
    textoResultado = strcat("x", mat2str(i), " = ", mat2str(x(i)));
    disp(textoResultado)
  endfor
catch err
  fprintf('Error: %s\n',err.message);
end
