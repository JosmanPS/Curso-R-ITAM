PCAplot <- function(PC) {
  
  library(ggplot2)
  library(grid)
  
  #Crea un data frame con los scores de los individuos sobre las componentes
  data <- data.frame(obsnames = row.names(PC$x), PC$x)
  
  #Se crea la base del gr??fico con l??neas horizontales y verticales sobre cero
  plot <- ggplot(data, aes_string(x="PC1", y="PC2")) + geom_text(alpha=.4, size=3, aes(label=obsnames)) 
  plot <- plot + geom_hline(aes(0), size=.2) + geom_vline(aes(0), size=.2)
  
  #Creamos un dataframe con los scores de las variables sobre las componentes
  datapc <- data.frame(varnames=rownames(PC$rotation), PC$rotation)
  
  #Ajustamos los tama??os de las componentes principales en la gr??fica :P
  mult <- min(
    (max(data$PC2) - min(data$PC2)/(max(datapc$PC2)-min(datapc$PC2))),
    (max(data$PC1) - min(data$PC1)/(max(datapc$PC1)-min(datapc$PC1)))
  )
  
  datapc <- transform(datapc,
                      v1 = .7 * mult * (get("PC1")),
                      v2 = .7 * mult * (get("PC2"))
  )
  
  plot <- plot + coord_equal() + geom_text(data=datapc, aes(x=v1, y=v2, label=varnames), size = 5, vjust=1, color="red")
  plot <- plot + geom_segment(data=datapc, aes(x=0, y=0, xend=v1, yend=v2), arrow = arrow(length=unit(0.2,"cm")), alpha=0.75, color="red")
  plot
  
}