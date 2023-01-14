close all
clear
clc

n=10;
tipo=3; %tipo: 1-or; 2-and; 3-xor; 4-región
algoritmo=2; %1 perceptron; 2-adaline madaline
datos=generardatos(n,tipo,algoritmo);
size_layer=3;

[capa,epocas]=madaline_learning(datos,size_layer);
