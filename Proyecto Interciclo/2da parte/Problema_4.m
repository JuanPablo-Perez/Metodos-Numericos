%Centro de Telecomunicaciones de Ecuador requiere construir tres señales antenas
%receptora en tres ubicaciones distintas. Para instalar la primera antena ubicada
%en la provincia del Azuay la cual se encuentra a 27 horas desde las oficinas del
%centro de Telecomunicaciones, la cual se encuentra 5 grados al Este y 5 grados
%al Sureste. La segunda antena se instalará en Ambato a aproximadamente 5 horas 
%al este de las oficinas del centro de Telecomunicaciones, la cual se encuentra 
%a 30 grados al oeste desde el centro de Ambato y 10 grados al Suroeste desde ese
%punto.  La ultima antena se instalará en la provincia de Tungurahua que esta a 
%5 horas al este del centro de Telecomuniciones, la cual se encuentra a 10 grados
%al este y 30 grados al sur. 
%Para llegar mas pronto se toma un atajo, la primera antena toma un atajo de 10 
%grados al sur, para la segunda antena 35 grados al este y para la ultima antena 
%60 grados al sur. Desde el punto de partida
%Planteado un sistema de ecuaciones obtenemos que:
%27c1-5 c2-5 c3=10
%-5c1+30c2-10c3=-35
%-4c1-10c2-30c3=60
%Donde c1 representa los obtaculos para llegar al lugar, c2 el tiempo que en 
%recorrer dichos grados y c3 el tiempo en el que hace su último movimeinto.

function   primer_Problema(iteracionesMax, tolerancia);
format long
pkg load symbolic
warning('off','all');
syms x

% Matriz a desarollar 
A = [27,-5,-5;-5,30,-10;-5,-10,30]
b = [10;-35;60]
b2 = [0.1;-0.1;0.00001]
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