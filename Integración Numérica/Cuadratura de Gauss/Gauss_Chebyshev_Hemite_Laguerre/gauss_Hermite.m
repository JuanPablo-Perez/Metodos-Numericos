function [valor] = GaussHermite_2(funcion, n)
  nodosPeso  = [
    3, 0.707107, 0.886227, 0, 0, 0, 0 ;
    5, 0, 1.224745, 1.181636, 0.295409, 0, 0 ;
    5, 0.524648, 1.650680, 0.804914, 0.813128e-1, 0, 0;
    7, 0, 0.958572, 2.020183, 0.945308,  0.393619, 0.199532e-1;
    7, 0.436077, 1.335849,  2.350605, 0.724629, 0.157067, 0.453001e-2  ];
    
    nodosPeso = nodosPeso(n, 1:end);
    nodosPeso = nodosPeso(2:nodosPeso(1));
    xi = nodosPeso(1:length(nodosPeso)/2);
    Ai = nodosPeso((length(nodosPeso)/2)+1:end);
    valor = 0;
    for i = 1:length(Ai)
      valor = valor + Ai(i)*funcion(xi(i));
      valor = valor + Ai(i)*funcion(-xi(i));
    endfor
  endfunction
