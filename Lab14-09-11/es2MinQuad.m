clear all;
clc
format long e
x=[1e4; 2e4; 3e4; 4e4; 5e4];
y=[0.31; 0.95; 2.45; 4.1; 6.46];

n=3; % NUMERO DI COEFF 
m=5;
%g(x, a) = a1*x^2+ a2*x+ a3

X=[x.^2, x, ones(m,1)]

[Q, R]= qr(X);

Q_tld = Q(:,1:n);
R_tld = R(1:n,:);

a= backsub(R_tld, Q_tld'*y)



%Dato che il disegno mostra una parabola spezzata allora
x1= linspace(x(1), x(end), 100)';
yg= polyval(a,x1);

figure(1); clf
plot(x,y,'bo','Markerfacecolor','b', 'Displayname','dati')
legend('-dynamiclegend')
grid on 
hold on
plot(x1, yg, 'Displayname','Parabola min quad', 'Linewidth', 2);

xs= 55218;
ys=polyval(a, xs);
plot(xs, ys, 'rs', 'Markerfacecolor', 'r');

%% 
a=polyfit(x,y,2);
%terzo argomento: grado del polinomio da costruire

