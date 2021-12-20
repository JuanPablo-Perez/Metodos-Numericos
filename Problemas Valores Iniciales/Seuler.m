%Seuler
%       [datos1,datos2] = Seuler(funcion1, funcion2, intervalo, condicionesIniciales, paso, numero)
%
%       Parámetros entrada
%            funcion1 = Primera ecuacion diferencial
%            funcion2 = Segunda ecuacion diferencial
%            intervalo = Intervalo a evaluar
%            condicionesIniciales = condiciones iniciales de cada ecuacion diferencial
%            paso = paso 
%            numero = cantidad de ecuaciones diferenciales 
%
%        Parámetros salida
%             datos1 = valores en y
%             datos2 = valores en x


function [datos1,datos2] = Seuler(funcion1, funcion2, intervalo, condicionesIniciales, paso, numero)
  y0 = condicionesIniciales;     
  ne = numero;          
  x0 = intervalo(1);            
  xf = intervalo(2);         

  dx = paso;         
  n = (xf-x0)/dx;     

  x(1) = x0;

  for i = 1:ne
      y(i,1) = y0(i);
  end

% Iteraciones de Metodo de Euler
  for j = 1:n
      x(j+1) = x(j) + dx;
      y2 = y(:,j);
      Y1 = y2(1);
      Y2 = y2(2);

      dy_dx(1) = funcion1(Y1);
      dy_dx(2) = funcion2(Y1,Y2);

      fx = dy_dx;
      for i=1:ne
          y(i,j+1)=y(i,j)+fx(i)*dx;
      end
  end
  datos1 = y;
  datos2 = x;

endfunction
