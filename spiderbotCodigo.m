clc, clear all, close all 

disp('SIMULACIÓN PATA DE SPIDER BOT');

%OBTENER EL TAMAÑO DE LOS ESLABONES DEL SPIDERBOT Y LOS ÁNGULOS ACTUALES
L1 = input('INGRESE EL VALOR DEL PRIMER ESLABÓN en cm (Ejemplo: 8): ');
L2 = input('INGRESE EL VALOR DEL SEGUNDO ESLABÓN en cm (Ejemplo: 10): ');
L3 = input('INGRESE EL VALOR DEL TERCER ESLABÓN en cm (Ejemplo: 10): ');
q1 = input('INGRESE EL VALOR DEL PRIMER ÁNGULO DEL MOTOR en ° (Ejemplo: 0): ');
q2 = input('INGRESE EL VALOR DEL SEGUNDO ÁNGULO DEL MOTOR en ° (Ejemplo: 0): ');
q3 = input('INGRESE EL VALOR DEL TERCER ÁNGULO DEL MOTOR en ° (Ejemplo: 0): ');

%POSICIONES DE LAS ARTICULACIONES EN FUNCIÓN DEL TAMAÑO DE ESLABONES Y ÁNGULOS DEL MISMO
L1x = L1*sind(q1);
L2x = L1x+L2*cosd(q2)*sind(q1);
L3x = L2x-L3*sind(q3)*sind(q1);

L1y = 0;
L2y = -L2*sind(q2);
L3y = L2y - L3*cosd(q3);

L1z = L1*cosd(q1);
L2z = L1z + L2*cosd(q2)*cosd(q1);
L3z = L2z - L3*sind(q3)*cosd(q1);

%SE CREAN VECTORES QUE GUARDEN LAS PISICIONES, PARA POSTERIORMENTE GRAFICARLOS
x = [0, L1x, L2x, L3x];
y = [0, L1y, L2y, L3y];
z = [0, L1z, L2z, L3z];

plot3(x,-z,y,'b');
grid on
xlim([-(L1+L2+L3) L1+L2+L3]); 
zlim([-(L2+L3) L2+L3]); 
ylim([-(L1+L2+L3) L1+L2+L3]);