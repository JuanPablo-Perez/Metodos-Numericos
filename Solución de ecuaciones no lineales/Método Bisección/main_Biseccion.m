% Método bisección

    % Problema 1
% Se busca encontrar la altura a la cual debemos colocar una antena
% La función objetivo está dada por:
ecuacion  = atan(x/pi)+x.^5/2-1.3*(10)^6;
res1= biseccion(ecuacion, [10, 30], 100);
disp(strcat("La raiz 1 es:", mat2str(res1)));

% Problema 2
% Se busca  la distancia a la que un receptor de señal de radio se encuentra
% La función objetivo está dada por:
ecuacion  = e^x+x-6;
res2= biseccion(ecuacion, [1, 2], 100);
disp(strcat("La raiz 2 es:", mat2str(res2)));

disp(strcat("El problema 1 tiene raiz: " , mat2str(res1)));
disp(strcat("El problema 2 tiene raiz: ", mat2str(res2)));