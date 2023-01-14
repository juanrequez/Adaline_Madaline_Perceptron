function salida=evaluar_perceptron(neurona,entrada)

output=evaluar_adaline(neurona,entrada);

salida=(output+1)/2;
