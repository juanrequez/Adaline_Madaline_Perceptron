function output=evaluar_adaline(neurona,entrada)
%esta funci�n evalua la salida de una red adaline
%entrada es un vector columna
entrada=[1; entrada];

pesos=neurona.pesos;

argumento=pesos'*entrada;

output=cuantizador(argumento);




