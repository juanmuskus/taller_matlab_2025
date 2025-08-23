%% Regresión: Conceptos básicos
% Trabajo previo sugerido
% MATLAB Onramp – un tutorial introductorio gratuito de dos horas para aprender lo esencial de MATLAB.
%% ¿Qué es la regresión?
% La regresión se refiere a técnicas para estimar la relación entre una 
% variable dependiente y una o más variables independientes. En otras palabras, 
% es una forma de modelar una variable objetivo (dependiente) en función de otras variables (independientes).
% La regresión se utiliza ampliamente para:
%   * explicar o cuantificar la relación entre variables
%   * pronosticar o hacer predicciones a partir de datos
%% Regresión lineal simple
% Supón que quieres estimar el valor actual de tu casa en el mercado.
% Según tu experiencia, crees que el área en pies cuadrados de una casa 
% podría ser un buen indicador de su valor. Así que buscas anuncios recientes 
% en el vecindario para verificar y modelar la relación entre el precio de la propiedad 
% y su área en pies cuadrados.
load LinearData.mat x y                     % Cargar datos desde un archivo MAT
figure;
scatter(x,y)                                % Graficar los puntos de datos
xlabel("Area (sqft)")                       % Etiquetar el eje X
ylabel("Listed price (USD)")                % Etiquetar el eje Y
title("Listed price vs area of a house")    % Agregar un título

% Reflexiona: ¿Ves una tendencia o patrón en los datos?
% Aquí tienes una variable dependiente (precio) y una variable independiente (área) 
% que parecen estar correlacionadas linealmente. Este es un problema de regresión 
% lineal simple, que utiliza una línea recta para modelar la relación entre una 
% variable dependiente (y) y una variable independiente (x):
% y = a0 + a1*x

a1 =240;            % Establecer el valor para el coeficiente a1
a0 =160000;         % Establecer el valor para el coeficiente a0
 
figure("Position",[0 0 800 400]);          % Configurar una figura para la gráfica
PlotFit(x,y,[a1 a0],0);                    % Llamar a la función auxiliar para graficar el ajuste polinomial y las muestras de datos

%% Mínimos cuadrados ordinarios
% Tu objetivo con la regresión es encontrar el mejor modelo que describa la variable 
% dependiente como función de la/s variable/s independiente/s. Una forma de cuantificar 
% qué tan bien se ajusta tu modelo es calculando la suma de los errores cuadrados 
% (SSE) entre los valores reales y los valores predichos de la variable dependiente.
%    $\text{SSE} = \sum_{i=1}^{n}(y_i-\hat{y}_i)^2$
% donde y_i es el valor real de la variable dependiente correspondiente
% a la i-ésima muestra de datos de un total de n muestras y
% \hat{y}_i es el valor predicho correspondiente a la i-ésima muestra de datos
% de un total de n muestras

% Visualizar las barras de error y mostrar la suma de los errores cuadrados
a1 = 140;                                   % Establecer el valor para el coeficiente a1
a0 = 4000;                                  % Establecer el valor para el coeficiente a0
 
figure("Position",[0 0 800 400]);
PlotFit(x,y,[a1 a0],1);                     % Visualizar los errores

% Al sustituir el modelo de línea recta para los valores predichos, el objetivo
% de la regresión lineal simple ahora puede formularse como el siguiente
% problema de minimización:
%    $\text{min}_{a_0,a_1} \sum_{i=1}^{n} (y_i-(a_0+a_1x_i))^2$
% Puedes resolver esto analíticamente para a_1 y a_0 para obtener
%    $a_1 =
%    \frac{\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sum_{i=1}^{n}(x_i-\bar{x})^2$
% y
%    $a_0 = \bar{y}-a_1\bar{x}$
% donde
%    $\bar{x}$ es el promedio de todos los x_i
%    $\bar{y}$ es el promedio de todos los y_i
%    i indica las muestras individuales de datos de un total de n muestras

% Ejercicio: Verifica si tu selección manual de a1 y a0 coincide con los
% valores que obtienes de esta solución analítica.

xbar = mean(x)
ybar = mean(y)

% Calcular los valores de a1 y a0 usando las ecuaciones derivadas y las variables x, y, xbar y ybar.
% INTRODUCE EL CÓDIGO ABAJO

%% Funciones auxiliares locales
function yhat = PlotFit(x,y,A,ErrorFlag)

% Preparar los datos y calcular las predicciones del modelo
powers = length(A)-1:-1:0;
X = x'.^powers;
yhat = A*X';

% Graficar
plot(x,y,"o");
DispLine = sprintf("\nAjuste de línea \n" + "y = " + join(A + ["x^{"+string(powers(1:end-1))+"}",""] ," + "),"Interpreter","tex");
xlim([min(x)-0.5,max(x)+0.5]);
ylim([min(y)-0.5,max(y)+0.5]);
hold on
fplot(@(x)A*(x'.^powers)',"LineWidth",1.5);
legend("Muestras de datos",DispLine,"Location","eastoutside")
hold off
xlabel("x")
ylabel("y")
title("Modelo lineal")

if ErrorFlag
    hold on
    DispSSE = sprintf("\nErrores \nSSE = %12g",sum(yhat-y).^2);
    errorbar(x,y,min(yhat-y,0),max(yhat-y,0),".","vertical","DisplayName",DispSSE,SeriesIndex = 3);
    hold off
end

end