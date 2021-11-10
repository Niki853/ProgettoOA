x=[1:1:24];
x=x';
n=17;
m=24;
y=[73.72  23.39  17.11  20.31  29.37  74.74  117.02 298.04  348.13 294.75 253.78 250.48 239.48 236.52 245.04 286.74 304.78 288.76 247.11 216.73 185.78 171.19 171.73 164.05]
y= y';


figure(1); clf
plot(x,y,'bo','Markerfacecolor','b', 'Displayname','dati')
legend('-dynamiclegend')
grid on 
hold on
w= 2*pi/24;
X=[ones(m,1), sin(w*x), cos(w*x), sin(2*w*x), cos(2*w*x), sin(3*w*x), cos(3*w*x), sin(4*w*x), cos(4*w*x), sin(5*w*x), cos(5*w*x),  sin(6*w*x), cos(6*w*x), sin(7*w*x), cos(7*w*x),  sin(8*w*x), cos(8*w*x)]

[Q, R]= qr(X);

Q_tld = Q(:,1:n);
R_tld = R(1:n,:);

a= backsub(R_tld, Q_tld'*y)

x1= linspace(x(1), x(end), 100)';
g2 = @(x) a(1)+a(2)*sin(w*x)+a(3)*cos(w*x)+a(4)*sin(2*w*x)+a(5)*cos(2*w*x)+a(6)*sin(3*w*x)+a(7)*cos(3*w*x)+a(8)*sin(4*w*x)+a(9)*cos(4*w*x)+a(10)*sin(5*w*x)+a(11)*cos(5*w*x)++a(12)*sin(6*w*x)+a(13)*cos(6*w*x)+a(14)*sin(7*w*x)+a(15)*cos(7*w*x)+a(16)*sin(8*w*x)+a(17)*cos(8*w*x);
yg=g2(x1);

plot(x1, yg, 'Displayname','Parabola min quad', 'Linewidth', 2);