% Generating example data
x = linspace(1, 100, 100); % Creating an array of values from 1 to 100
y = log(x); % Applying logarithmic transformation to the array

% Plotting the transformation
figure;
plot(x, y, 'b.'); % Plotting the transformed values against the original values
xlabel('Original Values (x)');
ylabel('Logarithmic Transformation (log(x))');
title('Effect of Logarithmic Transformation');

% Optional: Plotting the identity line (y = x) for reference
hold on;
plot(x, x, 'r--'); % Plotting the identity line (y = x) in red dashed line
legend('Transformed Values', 'Identity Line (y = x)', 'Location', 'best');
hold off;