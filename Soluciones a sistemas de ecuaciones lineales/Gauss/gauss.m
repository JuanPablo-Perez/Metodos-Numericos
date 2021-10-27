%Gauss   (didáctica).
%       [Aesc, solucion] = gauss(A,b) 
%       Parámetros entrada
%            A = matriz cuadrada de coeficientes
%            b = matriz de términos independientes
%        Parámetros salida
%             Aesc =  matriz A escalonada 
%             solucion = vector solución de A


function  [Aesc,solucion]=gauss  (A, b);
  [q, w] = size(A);
  if q!= w
    msgID = 'Eliminiación Gaussiana: La matriz no es cuadrada';
    msg = 'La matriz no es cuadrada';
    error(msgID,msg)
  endif
  n = length(b);
  for j = 1:n-1;
    for k = j+1:n;
      al = -A(k,j)/A(j,j);
      for m = j:n;
        A(k,m) = A(k,m)+al*A(j,m);
      end
      b(k) = b(k)+al*b(j);
    end  
  end
  Aesc = cat(2, A, b);
  % Reemplazo de variables
[n n]=size(A);
A=[A';b']';
x=zeros(n,1);
for p=1:n
    for k=[1:p-1,p+1:n];
    m=-A(k,p)/A(p,p);
    A(k,:)=A(k,:)+m*A(p,:);
end
solucion= A(:,n+1)./diag(A);
end