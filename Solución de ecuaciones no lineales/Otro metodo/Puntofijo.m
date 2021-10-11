function raiz = Puntofijo(f,n,x1)
  for i=1:n
   x2 = f(x1);
   e = abs((x2-x1)/x2);
   formatSpec = 'Con %1.0f iteraciones la raiz es %4.5f con un error de %4.5f\n';
   fprintf(formatSpec,i,x2,e)
   x1=x2;
  endfor
  raiz = x2
