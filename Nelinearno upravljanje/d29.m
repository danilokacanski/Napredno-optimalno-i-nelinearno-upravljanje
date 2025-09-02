% Matlab/Simulink fazne analize nelinearnih sistema
clear
m = 1500;
Kc = 110;
Kf = 2.5;
Ka = 1;
Ki = 150;
Kp = 500;
vd = 30;
[X1,X2] =meshgrid(-5:.2:5); %definisanje grid-a u faznom prostoru
for i=1:size(X1,1)
   for j=1:size(X2,1)
      DX1(i,j) = vd - X2(i,j);
      DX2(i,j) = 1/m*(Ki * X1(i,j) + Kp*vd - Kp*X2(i,j) - Kc - Kf*X2(i,j) - Ka * X2(i,j) * X2(i,j));
   end
end
% racuna izvode u tackama grida
figure(1),clf
quiver(X1,X2,DX1,DX2) %strelice u tackama
hold on
x10=0;x20=0;
while (max(x10, x20) < 5.5)
   [x10,x20]=ginput(1);
   sim('pedal') %Simulink model sa pocetnim uslovima u integratorima x10 i x20
   figure(1),plot(yout(:,1),yout(:,2))
end
