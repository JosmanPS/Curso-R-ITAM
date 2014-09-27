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
[1] "/Users/josmanps/Desktop/Curso R/Pres2"
```

```r
# Para especificar un directorio de trabajo distinto
setwd("/Users/josmanps/Desktop/Curso R/Pres2")
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
[1] -0.5165
```

```r
median(x) # mediana
```

```
[1] -0.5387
```

```r
var(x) # varianza
```

```
[1] 1.006
```

========

```r
sd(x) # desviación estándar
```

```
[1] 1.003
```

```r
cor(x, y) # Correlación
```

```
[1] -0.1707
```

```r
cov(x, y) # Covarianza
```

```
[1] -0.5407
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

