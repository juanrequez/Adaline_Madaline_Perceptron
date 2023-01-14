function neurona=crear_adaline(input_number)
%esta función crea una neurona adaline e inicializa los pesos a valores
%aleatorios positivos y negativos entre -1 y 1.

pesos=-1+2*rand(input_number+1,1);

neurona.pesos=pesos;
end

