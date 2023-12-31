#import "../typst-ifsc/templates/article.typ": article


  #show: doc => article(
    title: "Avaliação 3",
    subtitle: "Processos Estocásticos (PRE029006)",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Rhenzo Hideki Silva Kajikawa",),
    date: "20 de Setembro de 2023",
    doc,
  )
= Comando da Avaliação
== Atenção
- Resolva apenas a questão sorteada
- Simule (Monte Carlo) todos os itens da questão no Octave/MATLAB
== Instruções gerais:
- A avaliação é individual. Não é permitida a troca de nenhum tipo de informação sobre a avaliação entre os alunos.
- Calculadoras, softwares, livros e outros materiais podem e devem ser utilizados, mas todos seus passos devem ser justificados.
- É permitido o envio de manuscritos digitalizado (ex: foto) ou de documento digital.
- Deverá ser enviado um único arquivo em formato *.zip* pelo *SIGAA*, contendo um arquivo *.pdf* e um ou mais arquivos *.m*.
- Deverá ser respeitada a data de fechamento indicado no *SIGAA*. Não serão aceitos envios por email.
- Dúvidas? Entre  em contato.


#pagebreak()
= Questão sorteada
*8.* Considere o processo estocástico
\ $X(t) = A "rect"(t-2) + B"rect"(t-3/2)$ 

onde A e B são variáveis aleatórias independentes, ambas uniformemente distribuídas sobre o intervalo real [0,4].

(a) Determine e esboce três possíveis realizações (funções-amostra) do processo, à sua escolha.


(b) Determine e esboce a função média de $X(t)$.

(c) Determine a função autocovariância de $X(t)$.


= Resolução
== (a) Determine e esboce três possíveis realizações (funções-amostra) do processo, à sua escolha.

#figure(
  image("./Figuras/a0b0.svg",width:80%),
);
#figure(
  image("./Figuras/a1b0.svg",width:80%),
);
#figure(
  image("./Figuras/a1b1.svg",width:80%),
);

#pagebreak()


== (b)  Determine e esboce a função média de $X(t)$.
$
mu_x (t) = E[x(t)]

\ mu_x (t) = E[A "rect"(t-2) + B"rect"(t-3/2)]

\ mu_x (t) = E[A "rect"(t-2)] + E[B"rect"(t-3/2)]

\ mu_x (t) = "rect"(t-2) times E[A] + "rect"(t-3/2) times E[B]

\ integral _0 ^4 a times 1/(4-0) dif a = 1/4 integral _0 ^4 a times dif a = 1/4 a^2 / 2 | _0 ^4 = (4^2 - 0^2)/8 = 16/8 = 2

\ E[A] = E[B]

\ mu_x (t) = 2[0<=t<=2]
$

#figure(
  image("./Figuras/media.svg",width:80%),
);


== (c) Determine a função autocovariância de $X(t)$.

$
\ C_x (t_1,t_2) = "cov"[ X(t_1) , X(t_2) ] 

\ C_x (t_1,t_2) = "E"[ X(t_1) , X(t_2) ] -"E"[ X(t_1) ]"E"[ X(t_2) ]
[]
\ "E"[ X(t_1) , X(t_2) ] = "E"[(A "rect"(t_1-2) + B"rect"(t_1 -3/2))times(A "rect"(t_2 -2) + B"rect"(t_2 -3/2))]
\ "E"[ X(t_1) , X(t_2) ] = "E"[A^2]"rect"(t_1 -2)"rect"(t_2 -2) +  A B "rect"(t_1 -3/2) "rect"(t_2 -2)  \ + A B "rect"(t_1 -2) "rect"(t_2 -3/2)  + B^2 "rect"(t_1 -3/2)"rect"(t_2 -3/2)]

\ "E"[ X(t_1) , X(t_2) ] = "E"[A^2] "rect"(t_1 -2)"rect"(t_ 2 -2) + E [A B]( "rect"(t_1-3/2) "rect"(t_2 -2) \ + "rect"(t_1 -2) "rect"(t_2 -3/2))  + "E"[B^2] "rect"(t_1-3/2)"rect"(t_2-3/2)

\ "E"[A^2] = integral _ 0 ^ 4 a^2 times 1/(4-0) dif a = 1/4 integral _ 0 ^ 4 a^2 dif a = 
1/4 a^3 /3 |_0 ^4 = 64/12 = 16/3
\ "E"[B^2] = integral _ 0 ^ 4 b^2 times 1/(4-0) dif b = 1/4 integral _ 0 ^ 4 b^2 dif b = 
1/4 b^3 /3 |_0 ^4 = 64/12 = 16/3
\ "E"[A B] = integral _ 0 ^ 4 integral _ 0 ^ 4 b a times (1/(4-0)) ^2  dif a dif b = 1/16  integral _ 0 ^ 4 integral _ 0 ^ 4 b a dif a  dif b = 1/16 integral _ 0 ^ 4 b integral _ 0 ^ 4  a dif a  dif b = 1/16 integral _ 0 ^ 4 b (a^2 /2 |_0 ^4) dif b 
\ = 1/16 integral _ 0 ^ 4 b ((4-0)^2 /2 ) dif b = 1/2  integral _ 0 ^ 4 b dif b = 1/2 b^2 /2 |_0 ^4 = 16/4 = 4 -> "E"[A B] = 4
\ 
"E"[ X(t_1) , X(t_2) ] = 16/3 ("rect"(t_1-2) "rect"(t_2-2) + "rect"(t_1-3/2)"rect"(t_2-3/2) ) \ + 4( "rect"(t_1-3/2) "rect"(t_2-2)  + "rect"(t_1-2) "rect"(t_2 -3/2))
\ "E"[ X(t_1) ] = 2 "rect"((t_1 -2)/2)
\ "E"[ X(t_21) ] = 2 "rect"((t_2 -2)/2)
\ C_x (t_1,t_2) = 16/3 ("rect"(t_1-2) "rect"(t_2-2) + "rect"(t_1-3/2)"rect"(t_2-3/2) ) \ + 4( "rect"(t_1-3/2) "rect"(t_2-2)  + "rect"(t_1-2) "rect"(t_2-3/2)) - 4 ("rect"((t_1 -2)/2) "rect"((t_2 -2)/2))
$ 