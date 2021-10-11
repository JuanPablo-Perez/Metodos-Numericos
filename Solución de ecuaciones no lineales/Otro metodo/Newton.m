function raiz = Newton(f,n,x1)
  syms x
  for i=1:n
    df = diff(f);
    f2=function_handle(f);
    df2=function_handle(df);
    x2=x1-(f2(x1)/df2(x1));
    e=abs((x2-x1)/x2);
    formatSpec = 'Con %1.0f iteraciones la raiz es %4.5f con un error de %4.5f\n';
    fprintf(formatSpec,i,x2,e)
    x1=x2;
  endfor
  raiz = x2
