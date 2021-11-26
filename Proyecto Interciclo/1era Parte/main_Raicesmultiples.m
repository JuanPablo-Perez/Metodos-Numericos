clear
clc
%Problema 1
%Se busca el valor en el cual un circuito transfiera la máxima potencia 
%a una carga, por lo cual se quiere encontrar las raices de la derivada
% de la funcion de la potencia la cual es:
%-2 * x .^ 3 / 105 + 4 * x .^ 2 / 21 + 32 * x / 105 - 65 / 21

syms x
fprintf("Problema  \n")
f= -2 * x .^ 3 / 105 + 4 * x .^ 2 / 21 + 32 * x / 105 - 65 / 21;
a = -10;
b = 12;
datos="";


try
  [r, e, n]= Raicesmultiples(f,a,b);
formatSpec = 'El valor de corte es %4.6f, ,el error es %4.6f ,el número de iteraciones es %1.0f\n';

for j = 1:length(r)
  fprintf(formatSpec,r(j),e(j),n(j))
end

catch err
  fprintf('Error: %s\n',err.message);
  %err.identifier
end 
  
 %Gráfica del problema 
  figura1 = figure(1);
t = a:0.1:b;
f2=function_handle(f);
plot(t,f2(t), 'g-', "linewidth", 1)
hold on;
grid on;

%Línea x = 0
lineaCero = 0.*ones(length(t));
plot(t, lineaCero, 'k-', "linewidth", 1);

%Líneas de cortes
for w =1:length(r)
  x0=r(w);
  y=[-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10];
  X=x0*ones(length(y));
plot(X,y,"r")
end 
x0=r(1);
y=[-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10];
X=x0*ones(length(y));
plot(X,y,"r")





