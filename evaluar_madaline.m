function output=evaluar_madaline(capa,entrada)

[~,num_neuronas]=size(capa.neurona);

for i=1:num_neuronas
    salida(i)=evaluar_adaline(capa.neurona(i),entrada(:,1));
end

output=mayority(salida);




