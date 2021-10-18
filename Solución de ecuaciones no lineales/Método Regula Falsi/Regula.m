%Regula Falsi    Raices de ecuaciones (did�ctica).
%   Regula(FUN,A,B,T,ITER) llenar
%       [c,datos] = Regula(fun, a, b, t, iter)
%       c = raiz de la funci�n
%       datos = todas las variables de la ejecuci�n
%       fun = la funci�n a tratar
%       [a,b] intervalo
%       t = tolerancia
%       erro = error existe entre aprox�maciones
%       iter = n�mero m�ximo de iteraciones
%
function [c,datos,i] = Regula(fun,a,b,tol=0.001,iter=1000)
i=1;

#f=@(x) eval(fun); % funciones an�nimas
f=fun;

while 1
    fa = f(a);
    fb = f(b);
    c = ((a*fb)-(b*fa))/(fb-fa);
    fc=f(c);
    datos(i,1)=a;
    datos(i,2)=b;
    datos(i,3)=c;
    datos(i,4)=fa;
    datos(i,5)=fb;
    datos(i,6)=fc;
    datos(i,7)=abs(c-a);
    if (fa*fb>0)
        fc=NaN;
        c=NaN;
        msgID = 'Regula_Falsi:condicion';
        msg = 'Error: f(a)*f(b)>0';
        error(msgID,msg);
    elseif i>iter
        msgID = 'Regula_Falsi:iteraciones';
        msg = 'Gran n�mero de iteraciones, posiblemente el m�todo divergi�';
        error(msgID,msg)
    else
        if i > 1
          error = abs((c-datos(i-1,3))/c);
        else
          error = abs((c-a)/c);
        endif
        if error< tol
            break;
        end
        if fa*fc > 0
            b = b;
            a = c;
        else
            a = a;
            b = c; 
        endif
    end
    i=i+1;
end