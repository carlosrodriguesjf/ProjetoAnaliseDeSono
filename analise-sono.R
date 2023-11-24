# ANÁLISE DE SONO

getwd()

# Instalando os pacotes
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")
library(readr)
library(dplyr)
library(ggplot2)

# Carregando o dataset
df_sono = read_csv("dados/sono.csv")

dim(df_sono)

# Visualizando os dados em formato de tabela
View(df_sono)

# visualizando parte dos dados
head(df_sono)

# resumo dos tipos de dados da coluna
str(df_sono)

# Sumario das variáveis numericas
summary(df_sono)

# exibindo o nome das colunas
print(colnames(df_sono))





## ANÁLISE EXPLORATÓRIA ###

# alterando o nome das colunas
colnames(df_sono) <- c("id","nome","idade","genero","duracao_sono","habitos_pre_sono", "problemas_sono",
                       "padrao_sono", "ambiente_sono", "cronotipo", "estresse", "cafeina","exercicio","peso","humor_ao_acordar")
print(names)

# Quantos linhas tem casos completos?
complete_cases <- sum(complete.cases(df_sono))

# Quantos linhas tem casos não completos?
not_complete_cases <- sum(!complete.cases(df_sono))

# percentual 
percentual <- (not_complete_cases / complete_cases) * 100
percentual

# removendo os objetos anteriores para liberar memoria ram

rm(complete_cases)
rm(not_complete_cases)


# verificando quais as idades presente
idades <- unique(df_sono$idade)
range(idades)
rm(anos)

# numero de registros por idade
table(df_sono$idade)


# extraindo variaeis numericas
lista_variaveis_numericas <- sapply(df_sono, is.numeric)
dados_numericos <- df_sono[lista_variaveis_numericas]


# matriz de correlação
cor(dados_numericos)

# plot correlação
pairs(dados_numericos)
pairs(dados_numericos[1:3],labels = colnames(dados_numericos)[1:3])
pairs(dados_numericos[4:6],labels = colnames(dados_numericos)[4:6])





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

