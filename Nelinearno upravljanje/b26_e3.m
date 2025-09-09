% Ranges (a > 0)
a = linspace(0.01, 5, 200);   % strictly positive a
b = linspace(-3, 3, 200);

% Grid
[A, B] = meshgrid(a, b);

% D(a,b)
numerator   =  B.^6 + B.^5.*A - 2*B.^4 - 2*B.^3.*A + 2*B.^2.*A.^2 - B.^2 - A.*B;
denominator = (B.^2 + 1).^2;
D = 1 - 4 * numerator ./ denominator;

% Plot surface
figure;
surf(A, B, D);
xlabel('a'); ylabel('b'); zlabel('D(a,b)');
title('D(a,b) with a > 0 and D=0 plane');
shading interp; colorbar; hold on;

% Add D = 0 plane
Z0 = zeros(size(A));
surf(A, B, Z0, 'FaceAlpha', 0.3, 'EdgeColor', 'none', 'FaceColor', 'red');

legend('D surface','D = 0 plane', 'Location', 'best');
view(45, 30); grid on; axis tight;
