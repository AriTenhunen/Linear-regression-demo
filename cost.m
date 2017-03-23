function J=cost(X, y, theta)
% Linear regression cost function

m=length(y);
J=0;
J=sum((theta(1)+theta(2)*X(:,2)-y).^2)/(2*m);

end
