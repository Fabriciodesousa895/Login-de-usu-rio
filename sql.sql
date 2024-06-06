

 SELECT     L.ID_USU || ' - ' || U.USU_NOME AS USUARIO,
           TO_CHAR(MAX(DT_ENTRADA),'DAY, DD "DE" MONTH "DE" YYYY') AS ULT_LOGIN,
           CASE WHEN TO_CHAR(TRUNC(SYSDATE) - TRUNC(MAX(DT_ENTRADA)))  = 0 THEN 'Login feito recentemente' ELSE
           'Há ' || TO_CHAR(TRUNC(SYSDATE) - TRUNC(MAX(DT_ENTRADA))) || ' dias sem fazer login' END AS SEM_LOGAR
                   
  FROM LOG_LOGIN L 
           INNER JOIN USU_USUARIO U ON U.ID_USU = L.ID_USU
  GROUP BY L.ID_USU,U.USU_NOME
  ORDER BY SEM_LOGAR DESC
--USANDO O TO_CHAR PRA TER UMA VISUALIZAÇÃO MAIS AMIGÁVEL PARA O USUÁRIO SEGUINDO ESTE FORMATO => QUINTA-FEIRA , 06 DE JUNHO DE 2024
--NO CASE WHEN IDENTIFICAMOS SE O USUÁRIO FEZ OO LOGIN RECENTIMENTE OU A QUANTOS SEM LOGAR
--FAZENDO UM INNER JOIN PARA TRAZER O NOME DO USUÁRIO NA TABELA USU_USUARIO

