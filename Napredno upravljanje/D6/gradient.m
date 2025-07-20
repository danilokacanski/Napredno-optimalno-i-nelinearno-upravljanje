%% Funckija prenosa oblika Gp(s) = b0 / (s^2 + a1*s + a0)
Tf = 1;

%%
t = out.tout;
a1 = out.theta.Data(1, :);
a0 = out.theta.Data(2, :);
b0 = out.theta.Data(3, :);

figure;
hold on;
grid on;
plot(t, a1, LineWidth = 1.5);
plot(t, a0, LineWidth = 1.5);
plot(t, b0, LineWidth = 1.5);
legend('a_1', 'a_0', 'b_0')
