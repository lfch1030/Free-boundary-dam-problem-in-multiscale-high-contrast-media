
M=mu+1;  %contrast




rand('twister',50482)
k=ones(100,100);
R=5;
for i=1:2:10
         r1=rand;
          k(2+(i-1)*10:5+(i-1)*10,1:10)=M*(1+R*r1);
          k(3+(i-1)*10:7+(i-1)*10,11:20)=M*(1+R*r1);
           k(5+(i-1)*10:8+(i-1)*10,21:30)=M*(1+R*r1);
          
          
           r1=rand;
          k(2+(i-1)*10:5+(i-1)*10,41:50)=M*(1+R*r1);
          k(3+(i-1)*10:7+(i-1)*10,51:60)=M*(1+R*r1);
           k(5+(i-1)*10:8+(i-1)*10,61:70)=M*(1+R*r1);
          
           r1=rand;
           k(2+(i-1)*10:5+(i-1)*10,81:90)=M*(1+R*r1);
          k(4+(i-1)*10:7+(i-1)*10,91:100)=M*(1+R*r1);
       
end



for i=2:2:10
    r1=rand;
    for j=1:2:10
       
k(4+(i-1)*10:6+(i-1)*10,2+(j-1)*10:6+(j-1)*10)=M*(1+R*r1);

    end
   
    k((i-1)*10+2:(i-1)*10+5,21:30)=M*(1+R*r1);
  k((i-1)*10+3:(i-1)*10+6,31:40)=M*(1+R*r1);
   k((i-1)*10+4:(i-1)*10+7,41:50)=M*(1+R*r1);
end



k(40:60,:)=1;

x=linspace(0,1,100);
y=linspace(0,1,100);
f=inline('(0.3*sin(6*pi*x)+1.1*x^2.2)*0.5+0.2');
g=inline('(0.3*sin(6*pi*x)+1.1*x^2.2)*0.5+0.24');



r1=rand;
for i=1:100
    for j=1:100
        if x(j)>=f(y(i)) & x(j)<=g(y(i))
            k(j,i)=M*(1+R*r1);
        end
    end
end


x=linspace(0,1,100);
y=linspace(0,1,100);
f=inline('(0.3*cos(6*pi*x+pi/2)+1.1*x^2.2)*0.5+0.50');
g=inline('(0.3*cos(6*pi*x+pi/2)+1.1*x^2.2)*0.5+0.55');



r1=rand;
for i=1:100
    for j=1:100
        if x(j)>=f(y(i)) & x(j)<=g(y(i))
            k(j,i)=1;
%            k(j,i)=M*(1+R*r1);
        end
    end
end

k(1:10,:)=1;
k(91:100,:)=1;
k(:,1:10)=1;
k(:,91:100)=1;
