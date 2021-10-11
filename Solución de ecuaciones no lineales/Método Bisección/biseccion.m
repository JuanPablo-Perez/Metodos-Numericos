function   [c, datos] = biseccion(ecuacion, intervalo, n_iteraciones) ;
  syms  x;
  datos = [];
  format  long;
  for  i = 1:n_iteraciones
    Fa = double(subs(ecuacion, x, intervalo(1)));
    c= double((intervalo(1)+intervalo(2))/2) ;
    Fc= double(subs(ecuacion,  x, c));
    datos = cat(1, datos,  c);
    if Fc == 0
      return  ;
    elseif  Fc*Fa>0
        intervalo = [c, intervalo(2)];
     else
        intervalo = [intervalo(1), c];
    endif
  endfor
endfunction