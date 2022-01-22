# Prácticas del Tema 3: SISTEMAS EXPERTOS EN CONTROL

## Sistema Experto para sintonía de un controlador PID

Objetivo: Mejorar de forma automática la sintonía cualitativa de los parámetros de un
controlador PID mediante un sistema experto cuyo motor de inferencias esté formado
por un conjunto de reglas obtenidas a partir de la experiencia (estudiado en la teoría).

Utilizar el programa “control_experto.m” que realiza una sintonía previa automática del
PID mediante el método de Ziegler-Nichols. A partir de los valores de Kp, Ki y Kd
obtenidos en dicha presintonía, realizar los siguientes ejercicios:

### 1º- Observar la respuesta del sistema cuando aumentamos o disminuimos las ganancias del PID.
### 2º- Formar una base de conocimientos (BC) con las observaciones anteriores sobre la influencia de esos parámetros en la respuesta del sistema (reglas).
### 3º- Encontrar unos valores aceptables de los incrementos o decrementos de los parámetros del PID para ser utilizados en las reglas.
### 4º- Introducir el código que implementa esas reglas en el archivo “sistema_experto.m”, donde se indica, para modificar los parámetros del PID de tal manera la respuesta del sistema cumpla unas especificaciones requeridas.

Inicialmente las especificaciones para el sistema de esta práctica son: tr <= 4 seg., tp < 20
seg., sobrelongación <=15%; tss < 30 seg., yss = 1 (en negrita las que se deben cumplir
prioritariamente).

