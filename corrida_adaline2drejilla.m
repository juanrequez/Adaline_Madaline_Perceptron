close all
clear
clc

n=10;
tipo=1; %tipo: 1-or; 2-and; 3-xor; 4-región
algoritmo=2; %1 perceptron; 2-adaline madaline
datos=generardatos(n,tipo,algoritmo);


[neurona,epocas]=adaline_learning(datos);
error=verificar_learning(neurona,datos);
