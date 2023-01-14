function datos=generardatos(n,tipo,algoritmo)
%tipo: 1-or; 2-and; 3-xor; 4-región
%algoritmo 1-percetron, 2-adaline madaline

vn=linspace(-0.7,-0.3,n);
vp=linspace(0.3,0.7,n);
[x,y]=meshgrid(vn,vn);

[f,c]=size(x);
datos=[];
for i=1:c
    datos=[datos; x(:,i) y(:,i)];
end

[x,y]=meshgrid(vn,vp);
[f,c]=size(x);
for i=1:c
    datos=[datos; x(:,i) y(:,i)];
end

[x,y]=meshgrid(vp,vn);
[f,c]=size(x);
for i=1:c
    datos=[datos; x(:,i) y(:,i)];
end

[x,y]=meshgrid(vp,vp);
[f,c]=size(x);
for i=1:c
    datos=[datos; x(:,i) y(:,i)];
end


switch tipo
    case 1 %or
        salida=or(datos(:,1)>0,datos(:,2)>0);
        
    case 2 %and
        salida=and(datos(:,1)>0,datos(:,2)>0);
       
    case 3 %xor
        salida=xor(datos(:,1)>0,datos(:,2)>0);
        
    case 4 %plano
        [x,y]=meshgrid(linspace(-1,1,n),linspace(-1,1,n));
        [f,c]=size(x);
        datos=[];
        for i=1:c
            datos=[datos; x(:,i) y(:,i)];
        end
        salida=((datos(:,1)+datos(:,2))>1);
        
end
salida=double(salida);
switch algoritmo
    case 1
        %no hacer nada
    case 2 %madaline adaline
        for i=1:length(salida)
            if salida(i)==0
                salida(i)=-1;
            end
        end
end
        
        


datos=[datos salida];


datos=datos';

figure
hold on;
[f,c]=size(datos);

num_inputs=f-1;
num_grupos=c;

for i=1:num_grupos
    
    entrada=datos(1:num_inputs,i);
    salida=datos(end,i);
    if salida==-1
        plot(entrada(1),entrada(2),'r.','linewidth',2)
    else
        plot(entrada(1),entrada(2),'b+','linewidth',2)
    end
    
end
xlabel('x1')
ylabel('x2')
