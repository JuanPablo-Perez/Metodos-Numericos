
% Funcion 
function [raiz, datos] = Secante(funcion, intervalo, n_iteraciones)
  format long;
  syms x;
  a = intervalo(1);
  b = intervalo(2);
  % Evaluar la funcion
  Fa = double(subs(funcion, x, a));
  Fb = double(subs(funcion, x, b));
  
  if Fb*Fa > 0
    raiz = "El intervalo introducido no cumple Fa*Fb < 0";
    datos = [];
    return
  endif
  datos = [];
  for i = 1 : n_iteraciones
    Fa = double(subs(funcion, x, a));
    Fb = double(subs(funcion, x, b));
    c = b - (Fb*(a-b))/(Fa-Fb);
    datos = cat ( 1 , datos, c);
    a = b;
    b = c;
  endfor
  raiz = c;
  
  return
