function capa=crear_madaline(input_number,layer_size)

for i=1:layer_size
    capa.neurona(i)=crear_adaline(input_number);
end

