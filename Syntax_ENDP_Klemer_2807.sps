***SINTAXE PARA RESUMO DO ENDP UFRJ 30-07-2016.

**************************************************************
CATEGORIZANDO O IPPO EM 3 CATEGORIAS         Analisando o n�mero de respostas e categorizando as respostas. 
**************************************************************.
******* ippo categ�rica com nova recodifica��o:

freq ippo

recode IPPO (0 thru 4 = 1) (5 thru 9 = 2) (10 thru 14 = 3) into IPPO3y.
VARIABLE LABELS ippo3y "IPPO categ�rica".

VALUE LABELS ippo3y  
1 "IPPO BAIXO"
2 "IPPO M�DIO"
3 "IPPO ALTO".


FREQUENCIES ippo3y.


******* IPPO3y segundo o tipo de v�nculo a5 � tipo de vinculo 
***** Teste com os Dados usando QUI-QUADRADO

******Antes de se fazer o teste pra esse caso estamos recodificando e separando os T�cnicos e os Terceirizados 

freq a5

recode a5 (1=1) (3=2) (4=2) (77=0) into a5y.
VARIABLE LABELS a5y "Tipo de v�nculo - IPPO".

VALUE LABELS a5y 
1 "Tercerizados"
2 "Servidor T�cnico Administrativo". 

FREQUENCIES a5y.

******** Teste de Signific�ncia

MEANS  ippo by a5y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.


******* Cruzamento

CROSSTABS ippo3y by a5y
/CELLS COLUMN
/STATISTICS CHISQ.




***** Vari�veis de Estudo do Bloco F e fazer gr�fico

recode f13 f14 f15 g4 g10 (0=0) (1=0) (2=1) (3=2) (4=2) (77=0) into f13y f14y f15y g4y g10y.


*****Teste de signific�ncia

MEANS  f13y f14y f15y g4y g10y  by IPPO3y
/CELLS mean COUNT  MEDIAN MIN MAX STDDEV SEMEAN
/STATISTICS ANOVA.


******Tabela de Contig�ncia f13y - f15y g4y g10y

CROSSTABS f13y f14y f15y g4y g10y by ippo3y
/cells COLUMN
/STATISTICS CHISQ.


