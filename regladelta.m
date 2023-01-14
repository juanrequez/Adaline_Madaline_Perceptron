function pesosn=regladelta(neurona,entrada,salida)
%regla delta según ADAMAL1.pdf

eta=0.01; %ajustarlo como entrada

entrada=[1; entrada];

pesos=neurona.pesos;

pesosn=pesos+eta*(salida-pesos'*entrada)*entrada;

