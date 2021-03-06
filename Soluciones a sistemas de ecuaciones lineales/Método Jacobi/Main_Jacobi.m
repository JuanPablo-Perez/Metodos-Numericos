%Autores : Carlos Calle, Francisco Cedillo y Juan P?rez
%
%Fecha : 29/10/2021
%Descripci?n : El programa tiene la finalidad de resolver
%              sistemas de ecuaciones lineales por el 
%              m?todo iterativo de Jacobi


%                  Problema 1
%Halle el potencial en a,b,c,d si luego de realizar el an?lisis
%nodal tenemos el siguiente sistema de ecuaciones:
%   -7a   +   2b  +    0   + 4d   = -60 
%     a   -   4b  +   2c   +  0   = -90 
%     0   -   5b  +  11c   -  2d  =  0   
%    5a   +   0   +   2c   -  8d  = 300 


clc
clear
disp("PROBLEMA 1")
A = [-7,2,0,4;1,-4,2,0;0,-5,11,-2;5,0,2,-8]
b = [-60;-90;0;300]
n = length(b);
iteraciones = 1000;
x0 = rand(n,1);
tolerancia = 0.0001;

try
  [solucion , iteraciones]= Jacobi(A,b,tolerancia,iteraciones,x0);
   disp(strcat('El vector solucion del problema 1 obtenido luego de  ', mat2str(iteraciones), ' iteraciones es: '))
   for i=1:length(solucion);
    textoResultado = strcat("x", mat2str(i), " = ", mat2str(solucion(i)));
    disp(textoResultado)
   endfor
catch err
  fprintf('Error: %s\n',err.message)
end



disp('')
disp("PROBLEMA 2")

%                   Problema 2
% Encuentre las corrientes i1, i2, i3, i4, Si lsego de realizar el 
% an?lisis obtenemos el sistema de ecuaciones:
%   7i1   -  2i2   +    0  +    0  =    8
%  -2i1   +  6i2   -  4i3  +    0  =    4
%     0   -  4i2   +  5i3  -   i4  = - 10
%     0   +    0   -   i3  +  5i4  = -  4
A2= [7, -2, 0, 0;  -2, 6, -4, 0; 0, -4, 5, -1; 0, 0, -1, 5]
b2= [8 ;4 ;-10; -4]
n2 = length(b2);
iteraciones2 = 1000;
x02 = rand(n,1);
tolerancia2 = 0.0001;
try
  [solucion , iteraciones]= Jacobi(A2,b2,tolerancia2,iteraciones2,x02);
   disp(strcat('El vector solucion del problema 2 obtenido luego de  ', mat2str(iteraciones), ' iteraciones es: '))
    for i=1:length(solucion);
      textoResultado = strcat("x", mat2str(i), " = ", mat2str(solucion(i)));
      disp(textoResultado)
    endfor
catch err
  fprintf('Error: %s\n',err.message)
end

