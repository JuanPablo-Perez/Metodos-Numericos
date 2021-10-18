%Autores : Carlos Calle, Francisco Cedillo y Juan P�rez
%
%Fecha : 18/10/2021
%Descripci�n : El programa tiene la finalidad de resolver
%              ecuaciones no lineales por el m�todo de 
%              Regula Falsi o de la cuerda. 


                   
%                           Problema 1
%Se desea relizar la instalaci�n de una antena de radio, dicha
%instalaci�n se realizar� dentro de un intervalo $[1,2]$.
%Se desea encontrar un punto dentro del intervalo en el cual dicha
%instalaci�n se haga totalmente efectiva y rinda de la mejor manera. 
%La ecuaci�n esta dada por:

funcion1 = @(x) x.^5 -7*x.^2 -1;
a = 1;
b = 2;
delta = 1;
datos=""

try 
  [res1, datos, iter] = Regula(funcion1,a,b);
  fprintf('El valor de corte es y=%d, el n�mero de iteraciones es %d\n',res1,iter);
  h=figure(1);
  hold on;
  Fa= funcion1(a);
  Fb = funcion1(b);
  intervaloX = linspace(a, b);
  intervaloY = linspace(Fa, Fb);
  #Gr�fico funci�n 1
  plot(intervaloX,funcion1(intervaloX),"linewidth",4);
  #Grafico l�nea de corte
  plot(res1.*ones(length(intervaloY)), intervaloY,  'r-', "linewidth", 2);
  #L�nea cero
  plot(intervaloX, 0.*ones(length(intervaloX)),  'k-', "linewidth", 2)
  
  [n,m] = size(datos)
  fprintf('Interaci�n\ta\tb\tc\tf(a)\tf(b)\tf(c)\terror\n');
  for i=1:n
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



                                %Problema 2
%Se desea colocar un poste de luz desde la central telef�nica hasta
%un kil�metro hacia la derecha. Se desea encontrar un punto entre estas
%ubicaciones en el cual dicho poste no interfiera con ninguna conexi�n ya
%hecha y no de problemas algunos. 
%La ecuaci�n que nos ayudara a definir dicha ubicaci�n esta dada por:

ecuacion = @(x) exp(3*x)-4
a = 0;
b = 1;
delta = 1;
datos=""

try 
  [res2, datos2, iter] = Regula(ecuacion,a,b);
  fprintf('El valor de corte es y=%d, el n�mero de iteraciones es %d\n',res2,iter);
  t = figure(2);
  hold on;
  Fa= ecuacion(a);
  Fb = ecuacion(b);
  intervaloX = linspace(a, b);
  intervaloY = linspace(Fa, Fb);
  #Gr�fico funci�n 2
  plot(intervaloX,ecuacion(intervaloX),"linewidth",4);
  #Grafico l�nea de corte
  plot(res2.*ones(length(intervaloY)), intervaloY,  'r-', "linewidth", 2);
  #L�nea cero
  plot(intervaloX, 0.*ones(length(intervaloX)),  'k-', "linewidth", 2)
  
  [n,m] = size(datos2)
  fprintf('Interaci�n\ta\tb\tc\tf(a)\tf(b)\tf(c)\terror\n');
  for i=1:n
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