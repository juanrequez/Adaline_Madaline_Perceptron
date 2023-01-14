function error=verificar_learning_perceptron(neurona, datos)

[f,c]=size(datos);

num_inputs=f-1;
num_grupos=c;

for i=1:num_grupos
    entrada=datos(1:num_inputs,i);
    salida=datos(end,i);
    y(i)=evaluar_perceptron(neurona,entrada);
    error(1,i)=y(i)-salida;
end

error=error*error';