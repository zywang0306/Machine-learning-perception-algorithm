x1 = csvread('iris_train.csv',1,0);
x=x1(:,1:2);


y=csvread('iris_train.csv',1,2);
[m,n]=size(x);
x=[ones(m,1) x];
w=zeros(1,n+1);
for epoch=1:20
    iffinish=true;
    for index=1:m
        if sign(x(index,:)*w')~=y(index)
            iffinish=false;
            w=w+y(index)*x(index,:);
        end
    end
    if iffinish==true
        break;
    end

end

figure(1)
plot(x1(:,1),x1(:,2),'*');
hold on;
  
xline=linspace(0,5,20);
yline=-w(2)/w(3).*xline-w(1)/w(3);
plot(xline,yline);

figure(2)
x1 = csvread('iris_test.csv',1,0);
plot(x1(:,1),x1(:,2),'*');
hold on;
  
xline=linspace(0,5,20);
yline=-w(2)/w(3).*xline-w(1)/w(3);
plot(xline,yline);
