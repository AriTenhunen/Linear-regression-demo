function [theta,J_hist]=gradient(X,y,theta,alpha,i_num)
% Calculate gradient descent

m=length(y);
J_hist=zeros(i_num,1);

for i=1:i_num
    temp1=theta(1)-(alpha/m)*sum((theta(1)+theta(2)*X(:,2)-y));
    temp2=theta(2)-(alpha/m)*sum((theta(1)+theta(2)*X(:,2)-y).*X(:,2));
    theta(1)=temp1;
    theta(2)=temp2;
    J_hist(i)=cost(X,y,theta);
end
end
