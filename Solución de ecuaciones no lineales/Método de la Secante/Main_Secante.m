%Autores : Carlos Calle, Francisco Cedillo y Juan Pérez
%
%Fecha : 18/10/2021
%Descripción : El programa tiene la finalidad de resolver
%              ecuaciones no lineales por el método de la
%              secante. 
                   
                     
                    
                    % Problema 1 
%Se desea realizar el mantenimiento de una antena de señal,
%dicha antena se encuentra ubicada a una distancia x desde 
%lacentrar de los ingenieros que realizar en dicho mantenimiento.
%La distancia x esta dada por la siguiente ecuacion
%Encuntre que distancia tendran que recorrer los de mantimiento
%para llegar a la antena.

funcion1 = @(x)  x .^3 + 4*(x.^2) - 10 ;
#f = @(x) x.^2 - 5
a =  1 ;
b =  2 ;
delta = 1;
datos = "";


try
  [res1,datos,n_iteraciones] = Secante(funcion1,a,b);
  fprintf('El valo de corte es y=%d, el numero de iteraciones es %d\n',res1,n_iteraciones);
  h = figure(1);
  
  hold on;
  Fa= funcion1(a);
  Fb = funcion1(b);
  intervaloX = linspace(a, b);
  intervaloY = linspace(Fa, Fb);
  plot(intervaloX,funcion1(intervaloX),"linewidth",4);
  plot(res1.*ones(length(intervaloY)), intervaloY,  'r-', "linewidth", 2);
  plot(intervaloX, 0.*ones(length(intervaloX)),  'k-', "linewidth", 4)
  
  [n,m] = size(datos)
  fprintf('Iteración\ta\tb\t(raiz)\tf(a)\tf(b)\tf(raiz)\t error\n');
  
  for i =1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor
  
catch err
  fprintf('Error: %s\n',err.message);
end
hold off;
                          % Problema 2
%Se desea saber en que punto se puede realizar la instalación de una 
%antena de señal, donde se puedan emitir las ondas electromagnéticas 
%y que la antena receptora trasmita dichas ondas electromagneticas en 
%señales eléctricas variables, sin problema alguno.
%Se ha planteado una ecuación que parte desde la antena de recepción:
%Donde x representa la distancia la cual se tendra que poner la antena 
%de señal.Halle la distancia a la cual instalar la antena



ecuacion   =  @(x)  x .^3 + x + 16 ;
a =  -3 ;
b =  -2 ;
delta = 1;
datos = "";
try
  [res2,datos2,n_iteraciones] = Secante(ecuacion,a,b);
  fprintf('El valo de corte es y=%d, el numero de iteraciones es %d\n',res2,n_iteraciones);
  j = figure(2);
  
  hold on;
  Fa = ecuacion(a);
  Fb = ecuacion(b);
  intervaloX = linspace(a, b);
  intervaloY = linspace(Fa, Fb);
  plot(intervaloX,ecuacion(intervaloX),"linewidth",4);
  plot(res2.*ones(length(intervaloY)), intervaloY,  'r-', "linewidth", 2);
  plot(intervaloX, 0.*ones(length(intervaloX)),  'k-', "linewidth", 4);
  
  [n,m] = size(datos2)
  fprintf('Iteración\ta\tb\t(raiz)\tf(a)\tf(b)\tf(raiz)\t error\n');
  
  for i =1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos2(i,j));
    endfor
    fprintf('\n');
  endfor
  
catch err
  fprintf('Error: %s\n',err.message);
end
hold off;


