%Problema 1%
function   primer_Problema(iteracionesMax, tolerancia);
format long
pkg load symbolic
warning('off','all');
syms x

% Funcion objetivo
funcion1 = atan(x/pi)+x^5/2-1.3*(10)^6;
funcionG = @(t)  (2*(1.3*(10)^6 -atan(t/pi)))^(1/5);
intervalo = [10, 30];
puntoInicio = 12;

%Datos para grafica
tiempoProblema1 = [NaN];
convergenciaProblema1 =  [NaN];
iteracionesProblema1 = [NaN];


%Biseccion
disp('Metodo biseccion . . .' )
tic
try 
 [raiz, datos, i_Biseccion] = biseccion(funcion1, intervalo, iteracionesMax);
 convergencia_Biseccion= 1;
catch err
 convergencia_Biseccion= 0;
 i_Biseccion = NaN;
  fprintf('Error: %s\n',err.message)
end
tiempo_Biseccion = toc;
%
tiempoProblema1 = cat(1, tiempoProblema1, tiempo_Biseccion);
convergenciaProblema1 =  cat(1, convergenciaProblema1, convergencia_Biseccion);
iteracionesProblema1 =  cat(1, iteracionesProblema1, i_Biseccion);
%
disp('Fin metodo biseccion '   )
disp('')


%Newton
disp('Metodo Newton . . .' )
tic
try 
  [raiz,datos,i_Newton] = Newton(funcion1, intervalo , puntoInicio , tol =tolerancia, iter= iteracionesMax);
 convergencia_Newton= 1;
catch err
 convergencia_Newton= 0;
 i_Newton = iteracionesMax;
  fprintf('Error: %s\n',err.message)
end
tiempo_Newton = toc;
%
tiempoProblema1 = cat(1, tiempoProblema1, tiempo_Newton);
convergenciaProblema1 =  cat(1, convergenciaProblema1, convergencia_Newton);
iteracionesProblema1 =  cat(1, iteracionesProblema1, i_Newton);
%
disp('Fin metodo Newton '   )
disp('')


%Secante
disp('Metodo Secante . . .' )
tic
try 
  [raiz, datos,i_Secante] = Secante(funcion1, intervalo,  tol =tolerancia,iter= iteracionesMax);
 convergencia_Secante= 1;
catch err
 convergencia_Secante= 0;
 i_Secante = iteracionesMax;
  fprintf('Error: %s\n',err.message)
end
tiempo_Secante = toc;
%
tiempoProblema1 = cat(1, tiempoProblema1, tiempo_Secante);
convergenciaProblema1 =  cat(1, convergenciaProblema1, convergencia_Secante);
iteracionesProblema1 =  cat(1, iteracionesProblema1, i_Secante);
%
disp('Fin metodo Secante'  )
disp('')


%PuntoFijo
disp('Metodo Punto Fijo . . .' )
tic
try 
  [raiz,datos,i_PuntoFijo] = Puntofijo(funcion1, funcionG , intervalo, puntoInicio, tol =tolerancia,iter= iteracionesMax);
 convergencia_PuntoFijo= 1;
catch err
 convergencia_PuntoFijo= 0;
 i_PuntoFijo = iteracionesMax;
  fprintf('Error: %s\n',err.message)
end
tiempo_PuntoFijo= toc;
%
tiempoProblema1 = cat(1, tiempoProblema1, tiempo_PuntoFijo);
convergenciaProblema1 =  cat(1, convergenciaProblema1, convergencia_PuntoFijo);
iteracionesProblema1 =  cat(1, iteracionesProblema1, i_PuntoFijo);
%
disp('Fin metodo Punto Fijo'  )
disp('')

%Regula Falsi
disp('Metodo Regula Falsi . . .' )
tic
try 
  [raiz,datos,i_RegulaFalsi] = Regula(funcion1, intervalo,  tol =tolerancia, iter= iteracionesMax);
 convergencia_RegulaFalsi= 1;
catch err
 convergencia_RegulaFalsi= 0;
 i_RegulaFalsi = iteracionesMax;
  fprintf('Error: %s\n',err.message)
end
tiempo_RegulaFalsi= toc;
%
tiempoProblema1 = cat(1, tiempoProblema1, tiempo_RegulaFalsi);
convergenciaProblema1 =  cat(1, convergenciaProblema1, convergencia_RegulaFalsi);
iteracionesProblema1 =  cat(1, iteracionesProblema1, i_RegulaFalsi);
%
disp('Fin metodo Regula Falsi'  )
disp('')

%Graficos primer problema
metodos  = [0, 1, 2, 3, 4, 5];
subplot(3,1,1)
plot(metodos, tiempoProblema1, 'g')
xticklabels({' ', 'Biseccion' ,'Newton' , 'Secante' , 'Punto Fijo' , 'Regula Falsi' })
legend('Tiempo de ejecucion ')
subplot(3,1,2)
bar(metodos(2:end),convergenciaProblema1(2:end), 'r')
xticklabels({'Biseccion' ,'Newton' , 'Secante' , 'Punto Fijo' , 'Regula Falsi' })
legend(' Convergencia ')
subplot(3,1,3)
plot(metodos, iteracionesProblema1, 'b')
xticklabels({' ', 'Biseccion' ,'Newton' , 'Secante' , 'Punto Fijo' , 'Regula Falsi' })
legend(' Numero de iteraciones ')
endfunction