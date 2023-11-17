# ANÁLISE DE SONO

getwd()

# Instalando os pacotes
install.packages("readr")
install.packages("dplyr")
library(readr)
library(dplyr)


# Carregando o dataset
df_sono = read_csv("dados/sono.csv")

# Visualizando os dados em formato de tabela
View(df_sono)

# visualizando parte dos dados
head(df_sono)

# classe do dataframe
class(df_sono)

# resumo dos tipos de dados da coluna
str(df_sono)

# exibindo o nome das colunas
print(colnames(df_sono))

# alterando o nome das colunas
colnames(df_sono) <- c("id","idade","genero","horas_sono","problemas_sono","cafeina","exercicio","nome","peso","humor_ao_acordar")
print(names)

# contagem e histograma
count(df_sono, genero)
hist(df_sono$idade)

# Amostragem
sample_n(df_sono, size = 10)

# selecionando algumas colunas
sleepData <- select(df_sono,nome,idade,peso,problemas_sono, humor_ao_acordar)
head(sleepData)

# filtrando dados
filter(df_sono,peso >= 100)
filter(df_sono, peso >= 100, idade >= 50)

# concatenando funcoes
df_sono %>%
  select(idade, peso,problemas_sono) %>% 
  arrange(problemas_sono) %>% 
  head


df_sono %>%
  select(idade, peso,problemas_sono) %>% 
  arrange(desc(idade) ,problemas_sono) %>% 
  filter(peso >= 100)


df_sono %>%
  summarise(media_idade = mean(idade),
  min_idade = min(idade),  
  max_idade = max(idade),
  total = n())


df_sono %>%
  group_by(genero) %>%
  summarise(avg_idade = mean(idade),
            min_idade = min(idade),  
            max_idade = max(idade),
            total = n())

