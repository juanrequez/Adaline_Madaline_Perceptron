function [capa,count]=madaline_learning(datos,size_layer)

%cada columna de los datos es un grupo de entrenamiento, el dato en la
%última fila corresponde a la salida correspondiente a ese dato

[f,c]=size(datos);

num_inputs=f-1;
num_grupos=c;

% size_layer=9;

%inicializar capa
capa=crear_madaline(num_inputs,size_layer);

%procedimiento de entrenamiento
error=1;
count=0;

while and(error~=0,count<100)
    
    for i=1:num_grupos
        entrada=datos(1:num_inputs,i);
        salida=datos(end,i);
        M=evaluar_madaline(capa,entrada);
        if M~=salida
            ganador=competencia_madaline(capa,entrada,salida);
            pesosn=regladelta(capa.neurona(ganador),entrada,salida);
            capa.neurona(ganador).pesos=pesosn;
        end
        
    end 
    error=verificar_learning_madaline(capa,datos);
    count=count+1;
%     fprintf('epoca %d\n',count)
    
    capagraph(count)=capa;
end

% %graficación del procedimiento
% x=-2:0.1:2;
% for j=count:count
%     figure
%     hold
%     for k=1:size_layer
%         m(k)=-capagraph(j).neurona(k).pesos(2)/capagraph(j).neurona(k).pesos(3);
%         b(k)=-capagraph(j).neurona(k).pesos(1)/capagraph(j).neurona(k).pesos(3);
%         y=m(k)*x+b(k);
%         
% 
%         for i=1:num_grupos
%             
%             entrada=datos(1:num_inputs,i);
%             salida=datos(end,i);
%             if salida==-1
%                 plot(entrada(1),entrada(2),'r.','linewidth',2)
%             else
%                 plot(entrada(1),entrada(2),'b+','linewidth',2)
%             end
%             
%         end
%         plot(x,y,'k')
%     end
%     axis([-1.2 1.2 -1.2 1.2]);
% end

%graficación en 3d

figure
hold on
for i=1:num_grupos
    
    entrada=datos(1:num_inputs,i);
    salida=datos(end,i);
    if salida==-1
        plot3(entrada(1),entrada(2),entrada(3),'r.','linewidth',2)
    else
        plot3(entrada(1),entrada(2),entrada(3),'b+','linewidth',2)
    end
end

for k=1:size_layer
    j=count;
   a=-capagraph(j).neurona(k).pesos(2)/capagraph(j).neurona(k).pesos(4);
   b=-capagraph(j).neurona(k).pesos(3)/capagraph(j).neurona(k).pesos(4);
   bias=-capagraph(j).neurona(k).pesos(1)/capagraph(j).neurona(k).pesos(4);
   
  
[x,y]=meshgrid(linspace(-1,1,10),linspace(-1,1,10));
z=a*x+b*y+bias;
surf(x,y,z)
colormap('Gray')
end    
axis([-1 1 -1 1 -1 1]);    
grid
end
        
        
        
        
        
