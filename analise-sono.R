# ANÁLISE DE SONO

getwd()

# Instalando os pacotes
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)


# Carregando o dataset
df_sono = read_csv("sono.csv")

# Visisualizando os dados em formato de tabela
View(df_sono)

# visualizando parte dos dados
head(df_sono)

# classe do dataframe
class(df_sono)

# resumo dos tipos de dados da coluna
str(df_sono)

# contagem e hisstograma
count(df_sono, Gênero)
hist(df_sono$Idade)

# Amostragem
sample_n(df_sono, size = 10)

# selecionando algumas colunas
sleepData <- select(df_sono,Nome,Idade,Peso)
head(sleepData)

# filtrando dados

filter(df_sono,Peso >= 100)
filter(df_sono, Peso >= 100, Idade >= 50)
