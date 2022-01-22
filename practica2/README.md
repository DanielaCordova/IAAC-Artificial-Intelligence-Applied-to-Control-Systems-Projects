# Práctica 2: Control PID

Utilizando Matlab/Simulink, identificar un sistema en lazo abierto y usar los parámetros
del modelo para sintonizar un controlador PID en lazo cerrado Utilizar el bloque de
simulink “sistema”, suministrado dentro del modelo simulink “planta” (planta.zip). 

## 2.1. Identificación de un sistema sobreamortiguado mediante un modelo de primer orden.

Abrir el modelo ‘planta’; a continuación abrir una nueva ventana de simulink, y copiar
el bloque ‘sistema’ desde ‘planta’ al nuevo. Abrir el bloque “sistema” con doble clic y
rellenar los parámetros que se piden (tipo de planta: poner 1). Abrir la librería de
simulink y buscar en el directorio ‘sources’ un escalón unitario (step) y en ‘sinks’ el
bloque ‘scope’. Llevarlos a la ventana y conectar el sistema en lazo abierto.

### a) Ejecutar el sistema y observar la salida. Enviar los valores al WorkSpace (opción en el “scope” o con bloque simulink “to workspace”). 

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p1.png)

### b) A partir de la gráfica de la respuesta, medir el retardo, la ganancia del sistema y la constante de tiempo. Construir un modelo de primer orden (bloque “Transfer function”), con un retardo puro (bloque “Transport delay”), cuya repuesta coincida con la del bloque sistema para una entrada escalón unitario (superponer en una misma gráfica las dos respuestas para validarlo).

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p2.png)

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p3.png)


Con esto se hacen los siguientes pasos:

- K= se obtiene viendo la gráfica. 
```K = 19.84```
- Se trazó una recta y se obtuvo el valor del tiempo cuando corta con ese valor de eje x y luego usando el método de ziegler. También podría ser el valor que corta la recta en una recta en K. 
```Ts = 10.36```
- Luego el retardo viéndolo en la gráfica : ```2 seg```
```
K: Ganancia del sistema = 19.84
τ : Constante de tiempo = 10.36 seg
T : Retardo = 2 seg
```

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p31.png)

Luego con un ajuste fino:
```
Τ = 11
T = 3 seg
```

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p4.png)

Ahora la línea amarilla es la que es dada por el sistema y la línea azul es la dada por el sistema de primero orden que representa el sistema dado.


### c) Cambiar el valor del parámetro tipo de sistema a 2. Observar la salida. Explicar la razón o razones por las que ahora no es posible modelarlo con un sistema de primer orden más un retardo. 

La respuesta no es monótona creciente y puede ser representado por ecuaciones diferenciales ordinarias de primer orden, es decir, el máximo orden de la derivada es 1. No puede ser representada por primer orden.

Nota: Sin embargo, para poder usar este método es necesario que el sistema tenga un comportamiento del tipo sigmoidal o forma de S, esto quiere decir que la respuesta no puede tener sobre impulsos en lazo abierto, ni poseer una dinámica integradora que crezca constantemente con el tiempo.


## 2.2. Controlador PID. 

Observar el comportamiento del sistema en lazo cerrado (con realimentación unitaria
negativa). Comparar la salida en este caso con la salida en lazo abierto. Describir las 
principales diferencias que se observan. Emplear tanto 1 como 2 para el valor de tipo de
planta. Comentar la estabilidad del sistema en lazo cerrado.

### 2.2.1 Para tipo de planta = 1, emplear el método de Ziegler-Nichols de un sistema en lazo abierto para sintonizar el PID, es decir, obtener los valores de la planta: retardo, ganancia y constante de tiempo, y calcular con la tabla correspondiente los parámetros del PID. Aplicar el controlador al sistema en lazo cerrado.

Analizar las señales de salida, error, y control, para los tres tipos de controladores vistos
en teoría: P, PI y PID. Discutir cuál de ellos da mejores resultados.

#### LAZO ABIERTO:
Para sintonizar en lazo abierto, se usaron los datos dados en el anterior apartado. Se hizo una tangente en el grafico del sistema y se obtuvo:
```
- K(ganancia del sistema): 19.82
- L(retardo): 3.3
- T = 17.908
```
Luego se calculan los valores del PID con la siguiente tabla:

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p5.png)
![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p6.png)


#### LAZO CERRADO:
Luego con los valores anteriores, se aplica el control PID con los datos anteriores al lazo cerrado:

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p7.png)

##### Controlador P:
```Kp = 0.2737```

Se aproxima bastante a la referencia, pero hay un error en estado estacionario. Por ello, conocemos que debemos agregar la parte integral para arreglar esta parte

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p8.png)

##### Controlador PI:
```Kp = 0.2463
Ti = 11
```
Muy parecida a la dinámica del control P pero el controlador es ahora un poco más oscilatorio, se estabiliza de cierta manera en la referencia, esto es provocado por la acción integral (el error de offset). Sin embargo, podríamos querer que fuese menos oscilatorio. Esto será eliminado por la parcela derivativa.

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p9.png)

##### Controlador PID: 
Mejor resultado
```
Kp = 0.32844
Ti = 6.6
Td = 1.65
```

Es una dinámica mucho más comportada, tiene una pequeña oscilación y luego se estabiliza. 
El pico tiene una diferencia con respecto a donde debe estacionarse de 0.3091, esta en 1.3091; es un pico del 30.91%. Bastante tipico en este tipo de sintonias, un poco agresivas. Luego podemos hacer ajustes finos para mejorar el sistema.

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p10.png)

Por ejemplo, dividir la ganacia proporcional entre 2 -> Multiplicar todo por 0.5

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p11.png)

Ahora comparemos las 3:

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p12.png)

Dividiendo todas la ganancia proporcional entre 2 -> De esta manera respuesta más suave:

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p13.png)
- Controlador P (amarillo): al disminuir ganancia proporcional es lógico que nos alejemos más del setpoint.
- Controlador PI (morado): mucho mejor, se estabiliza más y no oscila tanto
- Controlador PID(azul): parecido al PI, ya no impulso tan grande, ahora es del 15%

EN RESUMEN:
Podemos observar que la acción proporcional estabiliza la salida tras un cierto tiempo, la acción integral al reducir el error nos obtiene el valor deseado, pero mantiene una sobrelongación. La acción derivativa, disminuye esta sobrelongación al “suavizar” o reducir la rapidez .
Otras formas de mejorar la sintonía: aproximando a sistema e 1er orden inicialmente:
Vemos cuando debería ir estabilizándose, en este caso tomamos el valor en t donde se estabiliza (el hace ese valor/4? Para Tp. Retardo se lo aumento un poco mas para que llegue a mas arriba y se aproxime más

### 2.2.2 Para tipo de planta = 2, emplear el método de Ziegler-Nichols de un sistema en lazo cerrado para sintonizar el PID, es decir, realizar el experimento en lazo cerrado con la planta para obtener la ganancia crítica y el periodo crítico, y calcular con la tabla correspondiente los parámetros del PID. Aplicar el controlador al sistema en lazo cerrado.

Se obtiene Ku dando valores en un sistema de control P hasta generar una estado críticamente estable.
``` Ku = 2.98,
Sistema mantiene oscilaciones constantes. Practica totalmente experimental. Luego obtenemos Tu midiendo en la gráfica:
Tu = 6.667 seg
```

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p14.png)

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p15.png)

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p16.png)

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p17.png)


##### Controlador P
Bastante oscilatorio, al final tiene un error en estado estacionario que es normal en todo controlador proporcional 

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p18.png)

##### Controlador PI
Incrementamos la acción oscilatoria, elimina el offset. Oscila pero ahora oscila cerca del setpoint. 
Como le dimos más tiempo, se ve que se estabiliza en el setpoint

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p19.png)

##### Controlador PID
La acción derivativa hace que las oscilaciones se reduzcan. Ahora existe un sobreimpulso, no es muy grade pero antes no estaba. Pero luego se estabiliza.

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p20.png)

IMPORTANTE:
-	Se alcanza el valor más rápidamente en el PID
-	Poca sobrelongación 
-	Menor error estacionario

Viendo estas dos:

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p21.png)

Son aproximaciones que puede tener nuestro controlador, pero no es que estos son específicos:
 Ahora podemos hacer ajustes finos y mejorar la dinámica del proceso, dinámica con mejor comportamiento:

Una de las formas: disminuir ganancia proporcional:
Ku/2:

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p22.png)

Oscilaciones bajan bastante:
- En P: Error estacionario mayor porque se bajo el Ku
- En PI: ya no oscila tanto y llega más rápido a la referencia:
- En PID: Se reduce el sobre impulso, ya no existe.

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p23.png)

### 2.2.3 Modificar de forma cualitativa los parámetros del PID y observar cómo varía la respuesta en función de la variación de cada ganancia del PID. Tomar nota de estas variaciones.

En el apartado anterior se modificó la ganacia dividiéndola entre 2: mejoró mucho. Principalmente en el PID

Dividiendo entre ku/3: Redujo aún más las oscilaciones pero tardó un poco más en llegar al valor

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p24.png)

### 2.2.4 Cambiar el bloque escalón unitario, de la entrada al sistema por el bloque ‘Entrada Variable’ suministrado en el modelo ‘planta’. Este bloque suministra una entrada que cambia aleatoriamente cada T segundos, entre los valores límite superior y límite inferior. Hacer doble clic sobre el bloque para ver los parámetros que tiene. Modificar si es necesario los valores de la entrada variable para que el sistema pueda seguir esa referencia. Simular para un sistema Tipo 1 o 2 en lazo cerrado con controlador. Comparar con la respuesta del mismo controlador a un salto para ese sistema.

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p25.png)

Se hizo con el control PID.
Se cambio el periodo de cambio a 36 ya que se vio que a partir de 35 el sistema era capaz de mantenerse en el valor estacionario hasta que este vuelve a cambiar. Oscila un poco y es suficiente para obtener la salida deseada. Si no hay muchos cambios bruscos, son mejores los valores y se logra estabilizar.

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p26.png)

Ahora se probará disminuyendo la ganancia del sistema a la mitad (k):

![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p27.png)
Nota: Oscila mucho menos.

### 2.3. Con ruido gaussiano. Repetir el apartado 2.2.1 ó 2.2.2 cambiando el valor del parámetro ruido en el bloque “sistema”. La planta es la misma que en los casos anteriores pero se le ha añadido ruido Gaussiano. Discutir el efecto del ruido sobre la acción derivativa del controlador. Utilizar distintos valores del ruido (entre 0 y 1). 

- 0.25:

 ![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p28.png)
 
 - 0.5:

 ![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p29.png)
 
 - 0.75:

 ![alt text](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/blob/main/Photos/p30.png)
 
 
