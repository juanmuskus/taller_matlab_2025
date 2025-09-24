# Implementando el método de la bisección

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=juanmuskus/taller_matlab_2025&file=metodo_bisección.mlx)

[![View Implementando el método de la bisección on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://la.mathworks.com/matlabcentral/fileexchange/182116-implementando-el-metodo-de-la-biseccion)

---

## Autor
**Juan Manuel Muskus Muskus**  
Correo: *jmuskus@correo.unicordoba.edu.co*  
Universidad de Córdoba  

---
## Resumen de la actividad
La actividad consiste en implementar y aplicar el **método numérico de la bisección** para aproximar la raíz de una función no lineal utilizando **MATLAB Online**.  

Los estudiantes deberán programar un script que reciba como entrada:  
- Una función continua definida en un intervalo [a,b].  
- Una tolerancia establecida como criterio de parada.  

A partir del **Teorema de Bolzano**, el algoritmo iterará hasta encontrar una aproximación de la raíz.  

Al finalizar, los estudiantes obtendrán:  
- Una **tabla con los valores intermedios**.  
- El **error de aproximación en cada paso**.  
- La **raíz estimada**.  

Esta práctica refuerza habilidades en:  
- Programación científica.  
- Análisis de convergencia.  
- Uso de herramientas computacionales aplicadas a la ingeniería.  

**Palabras clave:** método de bisección, MATLAB Online, raíces de funciones, métodos numéricos, enseñanza en línea, ingeniería.

---

## Objetivos de aprendizaje
Al finalizar esta actividad (2 horas de trabajo guiado en laboratorio de cómputo), los estudiantes de quinto semestre de Ingeniería de Sistemas serán capaces de:  

- Implementar en MATLAB el método de la bisección para aproximar raíces de funciones no lineales.  
- Documentar el proceso de programación.  
- Analizar la convergencia del algoritmo.  
- Aplicar conceptos de modelamiento matemático y métodos numéricos en la solución de problemas propios de la ingeniería.  

---

## Contexto y pre-requisitos
- La actividad está pensada para estudiantes de **Ingeniería de Sistemas** a partir de quinto semestre.  
- Se requieren conocimientos básicos de:  
  - Funciones continuas y su representación matemática.  
  - Programación en MATLAB.  
  - Fundamentos de cálculo (derivadas, continuidad, teorema de Bolzano).  

**Recomendación previa:**  
Realizar el curso introductorio gratuito [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), que enseña los fundamentos de MATLAB en 2 horas.

---

## Asignaturas o departamentos
- Métodos Numéricos.  
- Matemáticas Aplicadas.  
- Programación Científica.  
- Modelamiento Matemático en Ingeniería.  

---

## Notas para los educadores
- Se recomienda trabajar esta actividad en modalidad **laboratorio de cómputo**.  
- Seguir las secciones en orden, ya que algunas dependen de variables previas.  
- Se puede usar para:  
  - Evaluación formativa (entendimiento de conceptos).  
  - Práctica individual o en parejas.  
  - Refuerzo de la relación entre teoría matemática y programación.  
- Puede adaptarse para estudiantes de otros programas de ingeniería que requieran aproximación numérica de raíces.  

---

## Desarrollo de la actividad

### Sección 1: Conceptos
El método de la bisección se basa en el **Teorema de Bolzano**, que establece que si una función continua cambia de signo en un intervalo [a,b], entonces existe al menos una raíz dentro de ese intervalo.  

Conceptos clave:  
- Funciones continuas y condición de signo opuesto en los extremos del intervalo.  
- Aplicación del Teorema de Bolzano.  
- Iteraciones dividiendo el intervalo a la mitad.  
- Criterios de parada: tolerancia o número máximo de iteraciones.  
- Análisis de convergencia y cálculo del error.  

Ejemplo de código en MATLAB:  
```matlab
f = @(x) x.^3 - x - 2;   % Definición de la función
a = 1; b = 2;            % Intervalo inicial

if f(a)*f(b) < 0
    disp('Se cumple la condición de Bolzano: existe al menos una raíz en [a,b].')
else
    disp('No se cumple la condición de Bolzano en este intervalo.')
end

fplot(f,[a b])
hold on
yline(0,'--r')
xlabel('x'); ylabel('f(x)')
title('Visualización del método de bisección')
grid on
