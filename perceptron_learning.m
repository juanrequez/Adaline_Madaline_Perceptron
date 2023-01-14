function [neurona,count]=perceptron_learning(datos)

%cada columna de los datos es un grupo de entrenamiento, el dato en la
%última fila corresponde a la salida correspondiente a ese dato

[f,c]=size(datos);

num_inputs=f-1;
num_grupos=c;

%inicializar neurona
neurona=crear_perceptron(num_inputs);

%procedimiento de entrenamiento
error=1;
count=0;

while and(error~=0,count<100)
    

    for i=1:num_grupos
        entrada=datos(1:num_inputs,i);
        salida=datos(end,i);
        %step 3: calculate actual output Y(t)
        y(i)=evaluar_perceptron(neurona,entrada);
        %step 4: adapt weights
        if (y(i)-salida)~=0
            pesosn(:,i)=regla_perceptron(neurona,entrada,salida);
            neurona.pesos=pesosn(:,i);
        else
            pesosn(:,i)=neurona.pesos;
        end
        
    end
   
    error=verificar_learning_perceptron(neurona,datos);
    count=count+1;
    pesosgraph(:,count)=pesosn(:,i);
%     fprintf('epoca %d\n',count)

end

% %graficación del procedimiento
% x=-2:0.1:2;
% for j=count:count
%     
%     m=-pesosgraph(2,j)/pesosgraph(3,j);
%     b=-pesosgraph(1,j)/pesosgraph(3,j);
%     
%     y=m*x+b;
%     
%     
%     figure;
%     hold;
%     for i=1:num_grupos
%         
%         entrada=datos(1:num_inputs,i);
%         salida=datos(end,i);
%         if salida==0
%             plot(entrada(1),entrada(2),'r.','linewidth',2)
%         else
%             plot(entrada(1),entrada(2),'b+','linewidth',2)
%         end
%         
%     end
%     plot(x,y)
%     axis([-1.2 1.2 -1.2 1.2]);
%     
% end
% x=1:count;
% figure
% subplot(3,1,1)
% plot(x,pesosgraph(1,:),'k-+')
% ylabel('peso 1')
% subplot(3,1,2)
% plot(x,pesosgraph(2,:),'k-+')
% ylabel('peso 2')
% subplot(3,1,3)
% plot(x,pesosgraph(3,:),'k-+')
% ylabel('bias')
% xlabel('epoca');

%graficación en 3d

figure
hold on
for i=1:num_grupos
    
    entrada=datos(1:num_inputs,i);
    salida=datos(end,i);
    if salida==0
        plot3(entrada(1),entrada(2),entrada(3),'r.','linewidth',2)
    else
        plot3(entrada(1),entrada(2),entrada(3),'b+','linewidth',2)
    end
end

   a=-pesosgraph(2,count)/pesosgraph(4,count);
   b=-pesosgraph(3,count)/pesosgraph(4,count);
   bias=-pesosgraph(1,count)/pesosgraph(4,count);
   
  
[x,y]=meshgrid(linspace(-1,1,10),linspace(-1,1,10));
z=a*x+b*y+bias;
surf(x,y,z)
colormap('Gray')
    
axis([-1 1 -1 1 -1 1]);    
grid