%*8.* Considere o processo estocástico
%$X(t) = A "rect"(t-2) + B"rect"(t-3/2)$ onde A e B são variáveis aleatórias independentes, ambas uniformemente distribuídas sobre o intervalo real [0,4].
%(a) Determine e esboce três possíveis realizações (funções-amostra) do processo, à sua escolha.
%(b) Determine e esboce a função média de $X(t)$.
%(c) Determine a função autocovariância de $X(t)$.

close all; clear all; clc;

N = 10000;  % Número de experimentos probabilísticos
dt = 0.02;  % Passo do tempo
t = -5: dt :5;
t1 = t; t2 = t;
Nt = length(t);

% ----------------------------------------------------------------------------

% a) 3 Realizacoes do processo

A0 = 0;
B0 = 0;
A0B0 = A0 * (0 <= t & t < 1) + ...
       B0 * (1 <= t & t < 2);

figure; grid on; hold on;
plot(t, A0B0, 'b', 'LineWidth', 2);
title('Função-Amostra A = 0, B = 0');
xlabel('t'); ylabel('X(t)');
ylim([0 1.2]);


A1 = 1;

A1B0 = A1 * (0 <= t & t < 1) + ...
       B0 * (1 <= t & t < 2);
figure;
plot(t, A1B0, 'b', 'LineWidth', 2);
title('Função-Amostra A = 1, B = 0');
xlabel('t'); ylabel('X(t)');
ylim([0 1.2]);

B1 = 1;

A1B1 = A1 * (0 <= t & t < 1) + ...
       B1 * (1 <= t & t < 2);
figure;
plot(t, A1B1, 'b', 'LineWidth', 2);
title('Função-Amostra A = 1, B = 1');
xlabel('t'); ylabel('X(t)');
ylim([0 1.2]);
