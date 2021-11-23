%Problema 4%
function   primer_Problema(iteracionesMax, tolerancia);
format long
pkg load symbolic
warning('off','all');
syms x

% Funcion objetivo
funcion = exp(x)-4*x;
funcionG = @(t)  exp(t)/4;
intervalo = [0, 2];
puntoInicio = 1;

%Datos para grafica
tiempo = [NaN];
convergencia =  [NaN];
iteraciones = [NaN];


%Biseccion
disp('Metodo biseccion . . .' )
tic
try 
 [raiz, datos, i_Biseccion] = biseccion(funcion, intervalo, tol =tolerancia, iter= iteracionesMax);
 convergencia_Biseccion= 1;
catch err
 convergencia_Biseccion= 0;
 i_Biseccion = NaN;
  fprintf('Error: %s\n',err.message)
end
tiempo_Biseccion = toc;
%
tiempo = cat(1, tiempo, tiempo_Biseccion);
convergencia =  cat(1, convergencia, convergencia_Biseccion);
iteraciones =  cat(1, iteraciones, i_Biseccion);
%
disp('Fin metodo biseccion '   )
disp('')


%Newton
disp('Metodo Newton . . .' )
tic
try 
  [raiz,datos,i_Newton] = Newton(funcion, intervalo , puntoInicio , tol =tolerancia, iter= iteracionesMax);
 convergencia_Newton= 1;
catch err
 convergencia_Newton= 0;
 i_Newton = NaN;
  fprintf('Error: %s\n',err.message)
end
tiempo_Newton = toc;
%
tiempo = cat(1, tiempo, tiempo_Newton);
convergencia =  cat(1, convergencia, convergencia_Newton);
iteraciones =  cat(1, iteraciones, i_Newton);
%
disp('Fin metodo Newton '   )
disp('')


%Secante
disp('Metodo Secante . . .' )
tic
try 
  [raiz, datos,i_Secante] = Secante(funcion, intervalo,  tol =tolerancia,iter= iteracionesMax);
 convergencia_Secante= 1;
catch err
 convergencia_Secante= 0;
 i_Secante = NaN;
  fprintf('Error: %s\n',err.message)
end
tiempo_Secante = toc;
%
tiempo = cat(1, tiempo, tiempo_Secante);
convergencia =  cat(1, convergencia, convergencia_Secante);
iteraciones =  cat(1, iteraciones, i_Secante);
%
disp('Fin metodo Secante'  )
disp('')


%PuntoFijo
disp('Metodo Punto Fijo . . .' )
tic
try 
  [raiz,datos,i_PuntoFijo] = Puntofijo(funcion, funcionG , intervalo, puntoInicio, tol =tolerancia,iter= iteracionesMax);
 convergencia_PuntoFijo= 1;
catch err
 convergencia_PuntoFijo= 0;
 i_PuntoFijo = NaN;
  fprintf('Error: %s\n',err.message)
end
tiempo_PuntoFijo= toc;
%
tiempo = cat(1, tiempo, tiempo_PuntoFijo);
convergencia =  cat(1, convergencia, convergencia_PuntoFijo);
iteraciones =  cat(1, iteraciones, i_PuntoFijo);
%
disp('Fin metodo Punto Fijo'  )
disp('')

%Regula Falsi
disp('Metodo Regula Falsi . . .' )
tic
try 
  [raiz,datos,i_RegulaFalsi] = Regula(funcion, intervalo,  tol =tolerancia, iter= iteracionesMax);
 convergencia_RegulaFalsi= 1;
catch err
 convergencia_RegulaFalsi= 0;
 i_RegulaFalsi = NaN;
  fprintf('Error: %s\n',err.message)
end
tiempo_RegulaFalsi= toc;
%
tiempo = cat(1, tiempo, tiempo_RegulaFalsi);
convergencia =  cat(1, convergencia, convergencia_RegulaFalsi);
iteraciones =  cat(1, iteraciones, i_RegulaFalsi);
%
disp('Fin metodo Regula Falsi'  )
disp('')

%Graficos problema
figura = figure();
metodos  = [0, 1, 2, 3, 4, 5];
subplot(3,1,1)
plot(metodos, tiempo, 'g')
xticklabels({' ', 'Biseccion' ,'Newton' , 'Secante' , 'Punto Fijo' , 'Regula Falsi' })
legend('Tiempo de ejecucion ')
subplot(3,1,2)
bar(metodos(2:end),convergencia(2:end), 'r')
xticklabels({'Biseccion' ,'Newton' , 'Secante' , 'Punto Fijo' , 'Regula Falsi' })
legend(' Convergencia ')
subplot(3,1,3)
bar(metodos(2:end),iteraciones(2:end), 'b')
xticklabels({'Biseccion' ,'Newton' , 'Secante' , 'Punto Fijo' , 'Regula Falsi' })
legend(' Numero de iteraciones ')
endfunction