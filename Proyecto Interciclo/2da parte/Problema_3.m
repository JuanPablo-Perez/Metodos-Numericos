%Una empresa de ingenieros fabrica 4 modelos de computadoras personales: JP,CC,FC
%y CG. Para armar una computadora modelo JP se necesita 1 hora de ensamblado, es
%inmediato el proceso de prueba, 3 horas para la instalación de programas y con
%un sobrante de tiempo de 6 horas. Para una CC se requiere una hora de ensamblado,
%de los cuales en la cual tenemos que utilizar 4 minutos para el proceso de prueba,
%2 horas para instalar programas y no sobra nada de tiempo restante.  Para una FC 
%nos toma muy poco tiempo el ensamblado, pero tenemos 2 horas de prueba de las 
%cuales 7 minutos son para instalar los problemas faltantes y nos sobra 3 horas 
%para chequearla. Y por último la CG requiere de esas tres horas sobrantes  para
%el ensamblado, 1 hora para probar, no hay programas que instalar y tenemos una
%hora final para revisarla.Si la empresa dispone en horas por día 5,3 por pruebas,
%23 horas atrasadas para instalar programas y 5 horas de tiempo libre. 
%¿Cuatas computadores se puede producir por día?
%El sistema de ecuaciones quedaria:
% 1a+0b+3c-6d+5 =0
% 1a-4b+2c+0d+3 =0
% 0a+2b-7c+3d-23=0
%-3a+1b+0c+1d+5 =0

function   primer_Problema(iteracionesMax, tolerancia);
format long
pkg load symbolic
warning('off','all');
syms x

% Matriz a desarollar 
A = [1,0,3,-6;1,-4,2,0;0,2,-7,3;-3,1,0,1]
b = [-5;-3;23;-5]
b2 = [0.1;-0.1;0.001;0.00001]
B = b+b2
n = length(b);
x0 = rand(n,1);


%Datos para grafica
tiempo = [NaN];
error = [NaN];
condicionamiento = [NaN];
errorJacobi = [];
errorSeidel = [];

%Gauss
disp('Metodo de Gauss . . .' )
tic
try 
  [Aesc,solucionGauss]=gauss  (A, b);
  [Aesc,solucionGaussM] = gauss (A,B);
catch err
  fprintf('Error: %s\n',err.message)
end
%Cálculo sistema mal condicionado
condicionadoGauss = solucionGaussM - solucionGauss;
normaGauss=norm(condicionadoGauss,inf)/norm(solucionGauss,inf);
tiempo_Gauss = toc;
%
tiempo = cat(1, tiempo, tiempo_Gauss);
error = cat(1, error, 0);
condicionamiento = cat(1,condicionamiento,normaGauss);
%
disp('Fin metodo Gauss'   )
disp('')

%Gauss Jordan
disp('Gauss Jordan . . .' )
tic
try 
  [matriz, solucionJordan] = gauss_jordan(A,b);
  [matriz,solucionJordanM] = gauss (A,B);
catch err
  fprintf('Error: %s\n',err.message)
end
%Cálculo sistema mal condicionado
condicionadoJordan = solucionJordanM - solucionJordan;
normaJordan=norm(condicionadoJordan,inf)/norm(solucionJordan,inf);
tiempo_Gauss_Jordan = toc;
%
tiempo = cat(1, tiempo, tiempo_Gauss_Jordan);
error = cat(1, error, 0);
condicionamiento = cat(1,condicionamiento,normaJordan);
%
disp('Fin metodo Gauss Jordan '   )
disp('')

%Gauss pivote
disp('Gauss pivote . . .' )
tic
try
    [A_escalonada, solucionPivote] = gaussp(A,b);
    [A_escalonada,solucionPivoteM] = gauss (A,B);
catch err
  fprintf('Error: %s\n',err.message)
end
%Cálculo sistema mal condicionado
condicionadoPivote= solucionPivoteM - solucionPivote;
normaPivote=norm(condicionadoPivote,inf)/norm(solucionPivote,inf);
tiempo_Gauss_Pivote = toc;
%
tiempo = cat(1, tiempo, tiempo_Gauss_Pivote);
error = cat(1, error, 0);
condicionamiento = cat(1,condicionamiento,normaPivote);
%
disp('Fin metodo Gauss Pivote'  )
disp('')

%Jacobi
disp('Metodo de Jacobi . . .' )
tic
try
  [solucionJacobi , i_Jacobi]= Jacobi(A,b,tolerancia=tolerancia,iteraciones=iteracionesMax,x0);
  [solucionJacobiM , i_Jacobi]= Jacobi(A,B,tolerancia=tolerancia,iteraciones=iteracionesMax,x0);
catch err
  i_Jacobi= NaN;
  fprintf('Error: %s\n',err.message)
end
%Cálculo sistema mal condicionado
condicionadoJacobi= solucionJacobiM - solucionJacobi;
normaJacobi=norm(condicionadoJacobi,inf)/norm(solucionJacobi,inf);
%Calculo del error Jacobi
for i= 1:size(solucionJacobi)(1);
  solucionReal = solucionGauss(i);
  solucionConError = solucionJacobi(i);
  errorJacobi= cat(1, errorJacobi, abs((solucionReal-solucionConError)/solucionReal)*100);
endfor
promedioError = 0;
for i = 1:length(errorJacobi)
  valorActual = errorJacobi(i);
  promedioError = promedioError + errorJacobi(i);
endfor
promedioError = promedioError/length(errorJacobi);
errorJacobi = promedioError;
tiempo_Jacobi= toc;

%
tiempo = cat(1, tiempo, tiempo_Jacobi);
error = cat(1,error,errorJacobi);
condicionamiento = cat(1,condicionamiento,normaJacobi);
%
disp('Fin metodo Jacobi'  )
disp('')

%Gauss Seidel
disp('Metodo Gauss Seidel . . .' )
tic
try 
  [solucionSeidel , i_GaussSeidel]= gauss_seidel(A,b);
  [solucionSeidelM , i_GaussSeidel]= gauss_seidel(A,B);
catch err
  i_GaussSeidel= NaN;
  fprintf('Error: %s\n',err.message)
end
%Cálculo sistema mal condicionado
condicionadoSeidel= solucionSeidelM - solucionSeidel;
normaSeidel=norm(condicionadoSeidel,inf)/norm(solucionSeidel,inf);
%Calculo del error Gauss Seidel
for i= 1:size(solucionSeidel)(1);
  solucionReal = solucionGauss(i);
  solucionConError = solucionSeidel(i);
  errorSeidel= cat(1, errorSeidel, abs((solucionReal-solucionConError)/solucionReal)*100);
endfor
promedioError1 = 0;
for i = 1:length(errorSeidel)
  valorActual = errorSeidel(i);
  promedioError1 = promedioError1 + errorSeidel(i);
endfor
promedioError1 = promedioError1/length(errorSeidel);
errorSeidel = promedioError1;
tiempo_GaussSeidel= toc;
%
tiempo = cat(1, tiempo, tiempo_GaussSeidel);
error = cat(1,error,errorSeidel);
condicionamiento = cat(1,condicionamiento,normaSeidel);
%
disp('Fin metodo Gauss Seidel'  )
disp('')


%                   Graficos problema
figura = figure();
metodos  = [0, 1, 2, 3, 4,5];
%Gráfico comparación tiempo de ejecución
subplot(3,1,1)
plot(metodos, tiempo, 'g')
xticklabels({' ', 'Gauss' ,'Gauss Jordan' , 'Gauss Pivote' , 'Jacobi' , 'Gauss Seidel' })
legend('Tiempo de ejecucion ')
%Gráfico comparacion error
subplot(3,1,2)
bar(metodos(2:end),error(2:end), 'r')
xticklabels({'Gauss' ,'Gauss Jordan' , 'Gauss Pivote' , 'Jacobi' , 'Gauss Seidel' })
legend(' Error ')
%Gráfico sistema mal condiconado
subplot(3,1,3)
bar(metodos(2:end),condicionamiento(2:end), 'b')
xticklabels({'Gauss' ,'Gauss Jordan' , 'Gauss Pivote' , 'Jacobi' , 'Gauss Seidel' })
legend('Error S. mal condiconado ')