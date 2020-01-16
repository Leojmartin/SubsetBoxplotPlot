# abrimos el archivo
fp <- read.table ("desayuno.txt", header = T)


par(mfrow = c(2,2))
# TIPOS DE CLIENTES
plot (fp$sexo, main = 'Genero del cliente', col = c('cyan', 'pink'))
s = subset(fp, sexo == 'hombre', select = sexo)
cat ('La cantidad de hombres es que va al restaurant es:\n',length(s$sexo))
s = subset(fp, sexo == 'mujer', select = sexo)
cat ('\nLa cantidad de mujeres que va al restaurant es:\n', length(s$sexo))

# BEBIDAS
# tipo de bebida y frecuencia de consumo por los clientes
plot (fp$Bebida, main = 'Bebidas', col = 'orange', xlab = 'Tipos de bebida')


# AREPAS
plot (fp$Tipo_empanada_arepa, main = 'Relleno de arepa o empanada', col='purple', xlab = 'Tipos de Relleno')


# CONSUMO
par (mfrow = c (1,2))
cat ('\nPromedio de consumo en el restaurantes:\n', mean(fp$consumo))
hist(fp$consumo, ylab = 'Frecuencia', main = 'Histograma de consumo')
boxplot(fp$consumo, main = 'Boxplot de consumo', horizontal = F)


# CONSUMO POR GENERO
#consumoPromedioHombre = subset(fp, sexo == 'hombre', select = consumo)
consumoPromedioHombre = mean(fp[fp$sexo == 'hombre', c('consumo')])
#como fp[fp$sexo == 'hombre', c('consumo')] retorna integer podemos hacer directamente el calculo
# del promedio, mientras que  subset(fp, sexo == 'hombre', select = consumo) retorna un data frame

consumoPromedioMujer = mean(fp[fp$sexo == 'mujer', c('consumo')])
cat('\nEl consumo promedio por hombres es de:\n', consumoPromedioHombre,'\nEl consumo promedio por mujeres es de:\n', consumoPromedioMujer)

par(mfrow = c(1,1))
boxplot (split(fp$consumo, fp$sexo), main = "Relacion consumo-sexo", 
         ylab = "Gasto", col = c("orange", "pink"))


# CONSUMO SOBRE EL TIPO DE BEBIDAS
par(mfrow = c(1,1))
boxplot (split (fp$consumo, fp$Bebida), main = 'Consumo por bebidas')

# CONSUMO DE BEBIDAS POR GENERO
# hombres que toman como bebida cafe
HombresCafe = subset(fp, sexo == 'hombre' & Bebida == 'cafe', select = Bebida)
plot(HombresCafe, main = 'Consumo de cafe por hombres')


#boxplot(split(fp$consumo, fp$sexo), col = c('pink', 'cyan'))