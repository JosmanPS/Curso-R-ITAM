# ===========================================================================================
# A N Á L I S I S   D E   C O M P O N E N T E S   P R I N C I P A L E S   Y   C L U S T E R S
#                                                                 José Manuel Proudinat Silva
# ===========================================================================================

# Definimos el directorio de trabajo
setwd("/Users/josmanps/REPOS/Curso-R-ITAM")
# Cargamos el paquete ggplot2
library("ggplot2")
# Cargamos la función para gráficas de componentes principales
source("PCAplot.R")

# Generamos una base de datos
data(USArrests)
data <- USArrests
head(data)

# Aplicamos un ANÁLISIS DE COMPONENTES PRINCIPALES a los datos
PCA <- prcomp(data, scale = T, center = T)
PCA
summary(PCA)

# Gráfica de componentes
PCAplot(PCA)

# CLUSTERS
set.seed(130056)
# Generamos 3 clusters con la información contenida en las primeras 2 componentes principales
K.fit <- kmeans(x = PCA$x[,c(1,2)], centers = 3)
K.fit
clusters <- as.factor(K.fit$cluster)    # Guardamos en que grupo se clasificó a cada caso
centers <- K.fit$centers[,1:2]          # Guardamos los centros
centers <- as.data.frame(centers)   
names(centers) <- c("c1", "c2")

# Generamos una base de datos que contiene las primeras dos componentes y la clasificación
new.data <- data.frame(PCA$x[,1:2], clusters)
names(new.data) <- c("X1", "X2", "cluster")
row.names(new.data) <- row.names(data)
head(new.data)

# Graficamos los datos clasificados
plot <- ggplot(data = new.data, aes(x = X1, y = X2)) + geom_point(aes(col = cluster)) 
plot <- plot + geom_text(aes(label = rownames(new.data), col = cluster))
plot <- plot + geom_point(data = centers, aes(x = c1, y = c2, col = as.factor(1:3)), size = 70, alpha = 0.2, show_guide = F)
plot
