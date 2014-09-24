Error común en MAC
==========

Es común que cuando instalamos R en Mac nos aparezca un error del siguiente estilo:

1: Setting LC_CTYPE failed, using "C"

2: Setting LC_COLLATE failed, using "C"

3: Setting LC_TIME failed, using "C"

4: Setting LC_MESSAGES failed, using "C"

5: Setting LC_PAPER failed, using "C"

Este error nos traerá muchos problemas con el uso de acentos y otros símbolos en los códigos. Para corregirlo podemos hacer lo siguiente:

- Abrir la terminal.
- Escribir lo siguiente:
`defaults write org.R-project.R force.LANG en_US.UTF-8`
- Cerrar la terminal.
- Abrir R.
