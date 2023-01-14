function pesosn=regla_perceptron(neurona,entrada,salida)
y=evaluar_perceptron(neurona,entrada);

entrada=[1; entrada];

pesos=neurona.pesos;

pesosn=pesos+(salida-y)*entrada;