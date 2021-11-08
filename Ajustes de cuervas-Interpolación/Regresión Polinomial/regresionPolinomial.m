

function[ecuacion]  =  regresionPolinomial(orden, X, Y);
if length(X) ~= length(Y);
  msgID = 'Regresion Polinomial: las dimensiones de los vectores ingresados no coinciden';
  msg = "Las dimensiones de los vectores ingresados no coinciden'";
  error(msgID,msg)
endif
n = length(X);

if n < orden+1
  msgID = strcat('Regresion Polinomial: no es posible crear una regresion polinomial de ', mat2str(orden), " grado");
  msg = strcat('No es posible crearuna regresion polinomial de ', mat2str(orden), " grado");
  error(msgID,msg)
endif

a = [];
for i=1:orden+1;
  for j=1: i;
    k = i+j-2;
    sum = 0;
    for l=1:n;
      sum = sum+X(l).^(k);
    endfor
    a(i,j) = sum;
    a(j,i) = sum;
  endfor
  sum = 0;
  for l=1:n;
    sum = sum +Y(l)*X(l)^(i-1);
  endfor
  a(i, orden+2)=sum;
endfor
A = a(:,1:length(a)-1);
b = a(:, end);
[matriz, coeficientes] = gauss_jordan(A, b);
pkg load symbolic;
syms x;
ecuacion = 0;

for i = 1:orden+1;
  ecuacion = ecuacion  + coeficientes(i)*x.^(i-1);
endfor
ecuacion = matlabFunction(ecuacion);
endfunction