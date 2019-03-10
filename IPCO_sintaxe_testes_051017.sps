****** Sintax para o IPCO - TESTES

*************************** Recodifica��o das vari�veis de percep��o 

*******Com base nas perguntas do Question�rio 


FREQUENCIES h1 h2 h3. 
*******Frequencia das vari�veis a ser utilizadas no �ndice de Controle.


***Teste de confiabilidade do conjunto de vari�veis ** Criando a confiabilidade pelo teste de Alpha Cronbacth. 

RELIABILITY
/VARIABLES= h1 h2 h3  
/SCALE('ALL VARIABLES') ALL
/MODEL=ALPHA
 /STATISTICS=DESCRIPTIVE SCALE
/SUMMARY=MEANS.

 
****Recodificando as respostas das vari�veis do BLOCO H Controle.

RECODE h1 (0 thru 1 = 0) (2 thru 2 = 1) (3 thru 4 = 2) (77 THRU 88= SYSMIS) into h1y.
VARIABLE LABELS h1y "No/Na (Unid. Trabalho) se utilizam instrumentos e indicadores de controle?".

VALUE LABELS h1y
0 "Nunca - quase nunca"
1 "�s vezes"
2 "Sempre - quase sempre"
3 "NA".

RECODE h2 (0 thru 1 = 0) (2 thru 2 = 1) (3 thru 4 = 2) (77 THRU 88= SYSMIS) into h2y.
VARIABLE LABELS h2y "Os instrus. e indicadores de controle das suas atividades s�o explicados a voc�?".

VALUE LABELS h2y
0 "Nunca - quase nunca"
1 "�s vezes"
2 "Sempre - quase sempre"
3 "NA".

RECODE h3 (0 thru 1 = 0) (2 thru 2 = 1) (3 thru 4 = 2) (77 THRU 88= SYSMIS) into h3y.
VARIABLE LABELS h3y "Os instrus.e indicadores de controle das suas atividades s�o adequados para alcan�ar os objetivos estabelecidos?".

VALUE LABELS h3y
0 "Nunca - quase nunca"
1 "�s vezes"
2 "Sempre - quase sempre"
3 "NA".


FREQUENCIES h1y h2y h3y
/STATISTICS
/PERCENTILES 25 50 75 100.
**** Frequencias das vari�veis recodificadas com percentis, desvios


****Criando �ndice de Percep��o do Controle Organizacional.
Compute IPCO = sum (h1y, h2y, h3y).
execute.

Variable labels IPCO '�ndice de Percepcao do Controle Organizacional'.
VARIABLE Level IPCO (SCALE).

SUMMARIZE IPCO
/CELLS MIN MEAN MEDIAN MAX STDDEV.

*** Mostrar a Frequencia do IPCO, com os dados brutos , percentis e desvios. 

FREQUENCIES IPCO
/STATISTICS
/PERCENTILES 25 50 75 100.

*******Histograma

GRAPH
  /HISTOGRAM=IPCO.




*****Recodificando o �ndice em 3 categorias o IPCO em IPCO3y
**** Fiz v�rios testes na mesma sa�da de dados compararando e esse Recode foi o mais equilibrado nas respostas, minha percep��o
*** (0 a 1 - �ndice Baixo), (2 a 4 - �ndice m�dio ) e (5 e 6 - alto) 

Recode ipco (1 thru 1 = 1) (2 thru 4= 2) (5 thru 6 = 3) into ipco3y.
VARIABLE LABELS ipco3y "�ndice de Controle Organizacional Categ�rico".

VALUE LABELS ipco3y
1 "IPCO Baixo"
2 "IPCO M�dio"
3 "IPCO Alto".


SUMMARIZE IPCO3y
/CELLS MIN MEAN MEDIAN MAX STDDEV.

**** Frequ�ncia IPCO3y 

frequencies IPCO3y.

Frequencies IPCO3y
/STATISTICS
/PERCENTILES 25 50 75 100.


*******M�dias do IPCO segundo vari�veis categ�ricas e teste ANOVA

MEANS  IPCO by  a14x 
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
****** Cargo / Exerce fun��o de chefia

MEANS  IPCO by b3yz
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* Escolaridade 



MEANS IPCO by t4x
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
************ Anos de Servi�o Recodificados. 

MEANS  IPCO by  a19y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* N�veis de Capacita��o 

MEANS  IPCO by  a5y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* Tipo de v�nculo 

MEANS  IPCO by b1
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
****** Sabe ler ou escrever

MEANS  IPCO by T1x
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******** Idades em categoria


MEANS  IPCO by  t3let
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* Tempo de servi�o no servi�o p�blico 


MEANS  IPCO by  a17y 
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
********* Funcao 


**************** Teste ANOVA para vari�veis de Percep��o 


MEANS IPCO by h1y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.


MEANS IPCO by h2y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.

MEANS IPCO by h3y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.







************************************************* COM IPCO3y

**M�dias do IPCO segundo vari�veis categ�ricas e teste ANOVA

MEANS  IPCO3y by  a14x 
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
****** Cargo / Exerce fun��o de chefia

MEANS  IPCO3y by b3yz
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* Escolaridade 

MEANS IPCO3y by t4x
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
************ Anos de Servi�o Recodificados. 

MEANS  IPCO3y by  a19y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* N�veis de Capacita��o 

MEANS  IPCO3y by  a5y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* Tipo de v�nculo 

MEANS  IPCO3y by b1
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
****** Sabe ler ou escrever

MEANS  IPCO3y by T1x
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******** Idades em categoria


MEANS  IPCO3y by  t3let
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
******* Tempo de servi�o no servi�o p�blico 


MEANS  IPCO3y by  a17y 
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.
********* Funcao 





************************** Correla��es

CORRELATIONS ipco t3.


CORRELATIONS ipco t1.

GRAPH
/SCATTERPLOT t1 with ipco.

GRAPH
/SCATTERPLOT t5 with ipco.



*******VARI�VEIS CATEG�RICAS X VARI�VEL CATEG�RICA (IPPO3y): Q-QUADRADO 

***** a14x = func��o de chefia ,b3yz= escolaridade, t1x= idade em categoria, a19y= n�vel de capacita��o, a5y= tipo de vinculo, b1= Alfabetizado, 3tlet=tempo no servi�o p�blico, a17y=classe t�c admnistrativo   . 


**** mostrar por linha 

CROSSTABS a14x b3yz t1x a19y a5y b1 t3let a17y by ipco3y
/cells row
/STATISTICS CHISQ.




********* INDICE X VARI�VEIS CATEG�RICAS - PERGUNTAS GERADORAS DO �NDICE 

CROSSTABS IPCO by h1y 
/cells row
/STATISTICS CHISQ.



CROSSTABS IPCO by h2y 
/cells row
/STATISTICS CHISQ.


CROSSTABS IPCO by h3y
/cells row
/STATISTICS CHISQ.








************* Gr�ficos BOXPLOT 

DATASET ACTIVATE Conjunto_de_dados1.
EXAMINE VARIABLES=IPCO BY b3yz
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.
******Escolaridade


DATASET ACTIVATE Conjunto_de_dados1.
EXAMINE VARIABLES=IPCO BY a3
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.
******* Sexo

DATASET ACTIVATE Conjunto_de_dados1.
EXAMINE VARIABLES=IPCO BY a5y
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.
********* Tipo de v�nculo


DATASET ACTIVATE Conjunto_de_dados1.
EXAMINE VARIABLES=IPCO BY t1x
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.
*************** Grupo de Idades


DATASET ACTIVATE Conjunto_de_dados1.
EXAMINE VARIABLES=IPCO BY a17y
  /PLOT=BOXPLOT
  /STATISTICS=NONE
  /NOTOTAL.
********** Cargo / Classe T�cnico admistrativo





