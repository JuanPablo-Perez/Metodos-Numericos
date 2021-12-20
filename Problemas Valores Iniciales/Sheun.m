%Sheun
%       [y,x] = Sheun(funciones, intervalo, condicionesIniciales, paso, numero)
%
%       Parámetros entrada
%            funciones = Sistema de ecuaciones diferencial
%            intervalo = Intervalo a evaluar
%            condicionesIniciales = condiciones iniciales de cada ecuacion diferencial
%            paso = paso 
%            numero = cantidad de ecuaciones diferenciales 
%
%        Parámetros salida
%             y = valores en y
%             x = valores en x


function [y,x] = Sheun(funciones, intervalo, condicionesIniciales, paso, numero)
  
  x0 = intervalo(1);
  xf = intervalo(2);
  y0 = condicionesIniciales;

  ne = numero;

  f = funciones;

  h = paso;
  n = round((xf-x0)/h);
  x = linspace(x0,xf,n+1);
  y(:,1) = y0;

  % Iteraciones de Metodo de Heun
  for k=1:n
    k1=f(x(k),y(:,k));
    k2=f(x(k)+h,y(:,k)+k1*h);
    y(:,k+1)=y(:,k)+h/2*(k1+k2);
  
  end 
endfunction