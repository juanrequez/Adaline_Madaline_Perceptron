function datos=generardatos3d(n)

%algoritmo madaline

       

[x,y,z]=meshgrid(linspace(-1,1,n),linspace(-1,1,n),linspace(-1,1,n));
[f,c,m]=size(x);
datos=[];
for j=1:m
for i=1:c
    datos=[datos; x(:,i,j) y(:,i,j) z(:,i,j)];
end
end
salida=((datos(:,1)+datos(:,2)+datos(:,3))>0.2);
        

salida=double(salida);
for i=1:length(salida)
    if salida(i)==0
        salida(i)=-1;
    end
end


datos=[datos salida];


datos=datos';



    
end

