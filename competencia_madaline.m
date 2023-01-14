function ganador=competencia_madaline(capa,entrada,salida)

%número de neuronas en la capa
[~,num_neuronas]=size(capa.neurona);


%evaluar cada neurona en la capa para obtener su salida ponderada
in_extend=[1; entrada];



for i=1:num_neuronas
    neurona=capa.neurona(i);
    pesos=neurona.pesos;
    argumento(i)=pesos'*in_extend;
    saln(i)=evaluar_adaline(neurona,entrada);
end

selector=salida*saln;

matriz=[];
for i=1:num_neuronas
    if selector(i)<0
        matriz=[matriz; i abs(argumento(i))];
    end
end

[Y,indice]=min(matriz(:,2));

ganador=matriz(indice,1);

        