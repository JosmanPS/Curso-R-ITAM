Curso introductorio a R - Elementos y funciones básicas
========================================================
author: José Manuel Proudinat Silva

jmps2812@gmail.com

@JosmanPS

GitHub: JosmanPS

Directorio de trabajo
================
Antes que nada, siempre es importante especificar el directorio donde se guardará nuestro trabajo.

```r
# Para ver en qué directorio nos encontramos actualmente
getwd()
```

```
[1] "/Users/josmanps/REPOS/Curso-R-ITAM/Pres2"
```

```r
# Para especificar un directorio de trabajo distinto
setwd("/Users/josmanps/REPOS/Curso-R-ITAM/Pres2")
```

Asignación de variables e impresión
========

Para asginar variables utilizamos <-, también podemos usar "=" pero espreferible la primera manera

```r
text <- "El valor de Pi es: "
value <- pi
```

R es lenguaje orientado a objetos, donde cada variable es un objeto con una clase específica. Las clases de los objetos determinan qué funciones pueden aplicarse a ellos.

```r
class(text)
```

```
[1] "character"
```

=========

```r
class(value)
```

```
[1] "numeric"
```

Cuando queremos imprimir el valor de una variable podemos usar la función `print()`o simplemento escribir el nombre de la variable.

```r
print(value)
```

```
[1] 3.142
```

```r
value
```

```
[1] 3.142
```

========
Podemos imprimir múltiples variables del siguiente modo:

```r
print(text); print(value)
```

```
[1] "El valor de Pi es: "
```

```
[1] 3.142
```

```r
cat(text, value, "\n")
```

```
El valor de Pi es:  3.142 
```

=========
Si queremos conocer todas las variables que tenemos en nuestro entorno usamos la siguiente función:

```r
ls()
```

```
[1] "text"  "value"
```
O simplemente observamos en la ventana Envrionment de RStudio.

=========
Si queremos eliminar alguna variable en el entorno, utilizamos la función `rm()`.

```r
rm("value")
ls() # Observamos que la variable value ya no aparece
```

```
[1] "text"
```

Vectores
=======================
Para crear vectores utilizamos la función `c()`.

```r
c(1, 2, 3) # Vector numérico
```

```
[1] 1 2 3
```

```r
c("apple", "orange", "banana") # Vector de caracteres
```

```
[1] "apple"  "orange" "banana"
```

```r
c(TRUE, FALSE, FALSE) # Vector de tipo booleano
```

```
[1]  TRUE FALSE FALSE
```

===============
Podemos unir vectores con la misma función `c()`.

```r
v1 <- c(1, 2, 3)
v2 <- c(4, 5, 6)
c(v1, v2)
```

```
[1] 1 2 3 4 5 6
```

```r
v1 <- c("A", "B", "C")
v2 <- c(1, 2, 3)
c(v1, v2)
```

```
[1] "A" "B" "C" "1" "2" "3"
```

Algunas funciones básicas
===================

```r
# Generamos datos a partir de una distribución normal
x <- rnorm(n = 20)
x <- rnorm(20) # Default: mean = 0, sd = 1
y <- rnorm(n = 20, mean = 2, sd = 3)
```

====

```r
# Cargamos un paquete
library("ggplot2")
qplot(x, y) # Gráfica rápida del paquete ggplot2
```

![plot of chunk unnamed-chunk-12](Presentación 2-figure/unnamed-chunk-12.png) 

====

```r
mean(x) # media
```

```
[1] 0.2084
```

```r
median(x) # mediana
```

```
[1] 0.5534
```

```r
var(x) # varianza
```

```
[1] 1.15
```

========

```r
sd(x) # desviación estándar
```

```
[1] 1.072
```

```r
cor(x, y) # Correlación
```

```
[1] -0.2227
```

```r
cov(x, y) # Covarianza
```

```
[1] -0.6629
```

Comparaciones entre vectores
===================
A la hora de hacer operadores lógicos necesitamos saber como comparar vectores. Para ello es necesario conocer los operadores lógicos en R y algunas funciones que nos simplificaran muchas comparaciones.

```r
# Operadores lógicos
x <- 1
x == 0 # Igualdad
```

```
[1] FALSE
```

```r
x != 0 # Desigualdad
```

```
[1] TRUE
```

=======

```r
x < 0 # Menor que
```

```
[1] FALSE
```

```r
x > 0 # Mayor que
```

```
[1] TRUE
```

```r
x <= 0
```

```
[1] FALSE
```

```r
x >= 0
```

```
[1] TRUE
```

=========
Ahora veamos qué sucede con vectores.

```r
x <- c("A", "B", "C")
y <- c("A", "C", "B")
x == y
```

```
[1]  TRUE FALSE FALSE
```

```r
x != y
```

```
[1] FALSE  TRUE  TRUE
```

```r
x < y
```

```
[1] FALSE  TRUE FALSE
```

=========

```r
x > y
```

```
[1] FALSE FALSE  TRUE
```

```r
x <= y
```

```
[1]  TRUE  TRUE FALSE
```

```r
x >= y
```

```
[1]  TRUE FALSE  TRUE
```

=========

```r
# Si nos interesa saber si algun elemento coinciden
any(x == y)
```

```
[1] TRUE
```

```r
# Si queremos saber si todos los elementos coinciden
all(x == y)
```

```
[1] FALSE
```


Operaciones con bases de datos
===============

```r
data() # Nos muestra las bases de datos de muestra que trae R
```

```r
data(USArrests) # LLamamos a la base de datos
data <- USArrests # Asignamos los datos a la variable 'data'
head(data) # Vemos los primeros valores de la base
```

```
           Murder Assault UrbanPop Rape
Alabama      13.2     236       58 21.2
Alaska       10.0     263       48 44.5
Arizona       8.1     294       80 31.0
Arkansas      8.8     190       50 19.5
California    9.0     276       91 40.6
Colorado      7.9     204       78 38.7
```


==============
Cuando queremos aplicar funciones a estructuras de datos más sofisticadas que vectores, usamos la función `apply()`.

```r
# Aplicamos algunas funciones a los datos
apply(data, 2, mean) 
```

```
  Murder  Assault UrbanPop     Rape 
   7.788  170.760   65.540   21.232 
```

```r
# El valor 2 en apply() indica que queremos aplicar la función a las columnas, si escribieramos 1, indicaría que se aplica a los renglones 
```

===========

```r
var(data) # Matriz de varianzas y covarianzas
```

```
          Murder Assault UrbanPop   Rape
Murder    18.970   291.1    4.386  22.99
Assault  291.062  6945.2  312.275 519.27
UrbanPop   4.386   312.3  209.519  55.77
Rape      22.991   519.3   55.768  87.73
```

```r
cor(data) # Matriz de correlaciones
```

```
          Murder Assault UrbanPop   Rape
Murder   1.00000  0.8019  0.06957 0.5636
Assault  0.80187  1.0000  0.25887 0.6652
UrbanPop 0.06957  0.2589  1.00000 0.4113
Rape     0.56358  0.6652  0.41134 1.0000
```


Secuencias
=============
Las secuencias son muy importantes ya que nos permiten tener mejor control de los índices en matrices y vectores. Mostraremos unos ejemplos:

```r
# Secuencia simple
seq(from = 1, to = 10)
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
# Lo anterior es equivalente a hacer
1:10
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

===========
Si queremos que el intervalo entre cada elemento sea distinto de 1, necesitamos hacer lo siguiente:

```r
seq(from = 1, to = 11, by = 2)
```

```
[1]  1  3  5  7  9 11
```

=============
La función `rep()`es muy útil a la hora de escribir secuencias que se repitan.

```r
# Repetir un elemento
rep(1, times = 10)
```

```
 [1] 1 1 1 1 1 1 1 1 1 1
```

```r
# Podemos repetir un vector o secuencia
rep(c(1,2,3), times = 3)
```

```
[1] 1 2 3 1 2 3 1 2 3
```

=========

```r
# Podemos hacer que cada elemento de un vector o secuencia se repitan 
rep(c(1,2,3), each = 3)
```

```
[1] 1 1 1 2 2 2 3 3 3
```

```r
# Podemos crear una secuencia de un valor a otro indicando el tamaño
seq(from = 1, to = 2, length.out = 5)
```

```
[1] 1.00 1.25 1.50 1.75 2.00
```

Selección de elementos en vectores y matrices
=============
En esta sección mostraremos distintas formas de seleccionar muestras de vectores y matrices segun la tarea o la necesidad que tengamos. Primero veremos como funciona con **vectores**:

```r
pares <- 2 * 1:10 # Creamos un vector

# Vemos algunos de sus elementos individuales. Para esto solo indicamos en un [ ] el valor que deseamos
pares[1]
```

```
[1] 2
```

====

```r
pares[2]
```

```
[1] 4
```
Podemos obtener múltiples valores, indicando una secuencia de las posiciones o un vector indicador:

```r
pares[1:3]
```

```
[1] 2 4 6
```

```r
pares[c(2, 3, 6)]
```

```
[1]  4  6 12
```

========
Podemos también indicar que valores sean los que no se muestran del total de elementos, indicando las posiciones en valor negativo.

```r
pares[-1]      # Quita el primer elemento
```

```
[1]  4  6  8 10 12 14 16 18 20
```

```r
pares[- (1:3)] # Quita los primeros 3 elementos
```

```
[1]  8 10 12 14 16 18 20
```

```r
pares[- c(2, 3, 6)] # Quita los elementos indicados
```

```
[1]  2  8 10 14 16 18 20
```

========
También se puede indicar que valores queremos ver a través de vectores lógicos.

```r
pares > 10
```

```
 [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
```

```r
pares[pares > 10]
```

```
[1] 12 14 16 18 20
```

========
Haciendo un poco más de estadística, retomemos la base de datos que teníamos anteriormente:

```r
str(data)
```

```
'data.frame':	50 obs. of  4 variables:
 $ Murder  : num  13.2 10 8.1 8.8 9 7.9 3.3 5.9 15.4 17.4 ...
 $ Assault : int  236 263 294 190 276 204 110 238 335 211 ...
 $ UrbanPop: int  58 48 80 50 91 78 77 72 80 60 ...
 $ Rape    : num  21.2 44.5 31 19.5 40.6 38.7 11.1 15.8 31.9 25.8 ...
```

=====
Tomaremos un vector de nuestra base de datos y seleccionaremos elementos que nos interesan de él con un enfoque más estadístico:

```r
murder <- data$Murder  # Seleccionamos el vector de datos 'murder'
summary(murder)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   0.80    4.08    7.25    7.79   11.30   17.40 
```

=======

```r
murder[murder > mean(murder)] # Valores mayores que la media
```

```
 [1] 13.2 10.0  8.1  8.8  9.0  7.9 15.4 17.4 10.4  9.7 15.4 11.3 12.1 16.1
[15]  9.0 12.2 11.4 11.1 13.0 14.4 13.2 12.7  8.5
```

```r
murder[murder > median(murder)] # Valores mayores que la mediana
```

```
 [1] 13.2 10.0  8.1  8.8  9.0  7.9 15.4 17.4 10.4  9.7 15.4 11.3 12.1 16.1
[15]  9.0 12.2  7.4 11.4 11.1 13.0  7.3 14.4 13.2 12.7  8.5
```

=======

```r
# Valores en el primer o último decil
murder[murder < quantile(murder, 0.1) | murder > quantile(murder, 0.9)] # Notar que usamos | como 'or'
```

```
 [1] 15.4 17.4  2.2 15.4  2.1 16.1  2.1  0.8 14.4  2.2
```

```r
# Valores entre el tercer y quinto decil
murder[murder > quantile(murder, 0.3) & murder < quantile(murder, 0.5)]
```

```
 [1] 5.9 5.3 7.2 6.0 6.0 6.6 4.9 6.3 5.7 6.8
```

=====

```r
# Añadiremos algunos valores faltantes
murder[c(1, 3, 9, 32, 48, 11, 21, 30)] <- NA

# Podemos usar la selección de elementos para quitar los valores faltantes o valores nulos
murder[!is.na(murder) & !is.null(murder)]  # El signo ! indica que se tome el valor lógico contrario, en este caso no queremos saber los valores faltantes o nulos, sino los que no lo son, por eso usamos !
```

```
 [1] 10.0  8.8  9.0  7.9  3.3  5.9 17.4  2.6 10.4  7.2  2.2  6.0  9.7 15.4
[15]  2.1 11.3 12.1  2.7 16.1  9.0  6.0  4.3 12.2  2.1 11.4 13.0  0.8  7.3
[29]  6.6  4.9  6.3  3.4 14.4  3.8 13.2 12.7  3.2  2.2  8.5  4.0  2.6  6.8
```

======
A la hora de hacer selección de elementos en matrices o bases de datos, se aplica la misma lógica que cuando se hace con vectores. La diferencia radica en que las matrices tienen posiciones del estilo [i,j] de sus elementos.

```r
# Algunos ejemplos
data[15, 3] # Nos da el valor del individuo 15 en la variable 3
```

```
[1] 57
```

```r
# Podemos seleccionar una columna completa
data[ ,2]
data[ ,c(2,3)] # Más de una columna
```

=====

```r
# Seleccionamos un grupo de individuos
data[1:5, ]  # Los primeros 5 individuos
```

```
           Murder Assault UrbanPop Rape
Alabama      13.2     236       58 21.2
Alaska       10.0     263       48 44.5
Arizona       8.1     294       80 31.0
Arkansas      8.8     190       50 19.5
California    9.0     276       91 40.6
```

```r
data[1:5, c(2,4)] # Los primeros 5 individuos y solo las variables 2 y 4
```

```
           Assault Rape
Alabama        236 21.2
Alaska         263 44.5
Arizona        294 31.0
Arkansas       190 19.5
California     276 40.6
```

====

```r
# Podemos seleccionar por nombre
data["Arizona", c("Assault", "Rape")]
```

```
        Assault Rape
Arizona     294   31
```
En fin, cualquier forma que utilizamos para seleccionar elementos en vectores puede usarse al seleccionar elementos de matrices. Solo debemos recordar indicar tanto para i como para j el criterio de selección que se usará.


Operaciones matriciales
=========



