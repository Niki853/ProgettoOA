clear all
clc 
close all

x=[0; 0.04; 0.06; 0.1; 0.14; 0.25; 0.31];
y=[0; 0.03; 0.08; 0.09; 0.14; 0.20; 0.24];
%Abbiamo 2 incognite con 7 equazioni
n=2;
m=7;
%g(x,a)= a1*x+a2 dipende linearmente;
X=[x, ones(m,1)]

% 1) Calcolare la fattorizzazione QR di X
[Q, R]= qr(X);
% 2) Estrarre la matrice Qtilde ed Rtilde
Q_tld = Q(:,1:n);
R_tld = R(1:n,:);
% 3) Risolvere il sistema R tilde = Q ti * y
a= backsub(R_tld, Q_tld'*y)


figure(1); clf
plot(x,y,'bo','Markerfacecolor','b', 'Displayname','dati')
legend('-dynamiclegend')
grid on 
hold on

% Usiamo la funzione plyval per costruire la retta 
yg= polyval(a,x) %1 vettore coeff che voglio valutare su x; restituisce vettore delle y valutate
% EQUIVALENTEMENTE:  g=@(x) a(1)*x+a(2); yg=g(x)
plot(x, yg, 'Displayname','retta min quad', 'Linewidth', 2);
xlabel('sforzo')
ylabel('deformazione')
%xs= 
%ys=polyval(a, xs)
%plot(xs, ys, 'rs', 'Markerfacecolor', 'r');




