% Linear regression demo
% Ari Tenhunen, 2016

clc
clear all
close all

% training data
data=load('training_data.txt');
X=data(:,1); 
y=data(:,2);
m=length(y);

% visualization training data
plot(X,y,'bx','MarkerSize',9);
ylabel('Profits/10 k€');
xlabel('Population in 10k');

% calculate gradient 
X=[ones(m, 1),data(:,1)];
theta=zeros(2,1); % parameters theta0 and theta1

i_num=1500;  % number of iterations 
alpha=0.01;  % learning rate

% cost with theta0 and theta1 equals 0
cost(X,y,theta)

% run gradient descent
theta = gradient(X,y,theta,alpha,i_num);

% check theta values
fprintf('%f %f \n',theta(1),theta(2));

% linear fit visualization
hold on; 
plot(X(:,2),X*theta,'-')
legend('Training data','Linear regression')
hold off

% 42k, 65k predictions
predict1 = [1, 4.2] *theta;
predict2 = [1, 6.5] * theta;

% cost function visualization
theta0v = linspace(-10, 10, 100);
theta1v = linspace(-1, 4, 100);
Jv = zeros(length(theta0v), length(theta1v));

% Fill out J_vals
for i = 1:length(theta0v)
    for j = 1:length(theta1v)
	  t = [theta0v(i); theta1v(j)];    
	  Jv(i,j) = cost(X, y, t);
    end
end

Jv = Jv';
figure;
surf(theta0v, theta1v, Jv)
xlabel('\theta0'); 
ylabel('\theta1');

figure;
contour(theta0v, theta1v, Jv, logspace(-2, 3, 20))
xlabel('\theta_0'); 
ylabel('\theta_1');
hold on;
plot(theta(1),theta(2),'rx','MarkerSize',9,'LineWidth',2);
