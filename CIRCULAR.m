clc; 
clear all; 
close all; 
x=input('enter first sequence'); 
h=input('enter second sequence'); 
l= length(x); 
m=length(h); 
N=max(l,m); 
X=[x,zeros(1,N-1)]; 
H=[h,zeros(1,N-m)]; 
for i=1:N 
y(i)=0; 
for j=1:N 
S=mod((i-j),N); 
y(i)=y(i)+X(j)*H(S+1); 
end 
end 
z=cconv(x,h,N); 
disp(z); 
disp(y); 
subplot(2,2,1); 
stem(x); 
xlabel('x values'); 
ylabel('x(n)'); 
title('input sequence of x(n)'); 
subplot(2,2,2); 
stem(h); 
xlabel('h values'); 
ylabel('h(n)'); 
title('input sequence of h(n)'); 
subplot(2,2,3); 
stem(y); 
xlabel('n values'); 
ylabel('y(n)'); 
title('circular convolution without inbuilt function'); 
subplot(2,2,4); 
stem(z); 
xlabel('n values'); 
ylabel('z(n)'); 
title('circular convolution with inbuilt function'); 