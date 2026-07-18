## Minicurso de estimación de tiempos de divergencia - Colevol2026

### Introducción

La mayoría, si no todos, los métodos usados recientemente en biología evolutiva requieren filogenias en tiempo explícito/absoluto como *input* debido a que están basados en modelos markovianos de tiempo continuo. Sin embargo, en los árboles resultantes de la inferencia filogenética, las longitudes de rama representan una **combinación del número esperado de cambios por sitio y el tiempo** necesario para que dichos cambios se acumulen a lo largo de las ramas. Por esa razón, usar métodos que estimen esas longitudes de rama en unidades de tiempo absoluto resulta fundamental para análisis comparativos como evolución morfológica, biogeografía o estimacion de dinámicas macroevolutivas.

[MCMCtree](https://github.com/abacus-gene/paml/wiki/MCMCtree) es un programa de inferencia filogenética bayesiana usado para estimar los tiempos de divergencia entre los taxones a lo largo de una filogenia, es decir, permite poner en tiempo absoluto **una filogenia previamente estimada**. Este programa forma parte del paquete [PAML](https://github.com/abacus-gene/paml-tutorial/tree/main/mcmctree-approxlnL-aa).

Una de las estrategias más comunes para estimar los tiempos de divergencia de un grupo es asignar restricciones temporales (*constrains*) a uno o más nodos de la filogenia usando información de tiempo independiente o externa al análisis, este procedimiento se denomina **calibración de nodos**. En el caso de las **calibraciones primarias**, dicha información puede provenir de diversas fuentes como i) estimaciones geocronológicas de fósiles, en cuyo caso se usa el **registro fósil más antiguo del clado (nodo)** que queremos calibrar, lo que determina una edad mínima para dicho nodo, ó ii) estimaciones geocronológicas de eventos biogeográficos. En el caso de **calibraciones secundarias**, es posible usar estimaciones de tiempo para el nodo de interés, obtenidas de estudios previos de tiempos de divergencia.

En este tutorial vamos a estimar los tiempos de divergencia para el orden Carangiformes usando calibración de nodos. Los datos provienen de [Ossa-Hernández et al. 2024](https://doi.org/10.1111/jbi.15018). A continuación listamos los elementos necesarios para correr este tipo de análisis en ```MCMCtree```:

### Programas y paquetes:

- [BASEML](https://github.com/abacus-gene/paml/wiki/BASEML) -> Usado para estimar las tasas de substitución y las loingitudes de rama junto con el gradiente y la matriz Hessianan (i.e. **the approximate likelihood method**). <!-- This estimates will be used in rgene_gamma setting in mcmctree.ctl. The gradient and Hessian contain information about the curvature of the likelihood surface (dos Reis and Yang, 2013, P10) -->
- [MCMCtree](https://github.com/abacus-gene/paml/wiki/MCMCtree) -> Para estimar/separar tasa evolutiva y tiempo usando **MCMC**
- Paquete de R [mcmc3r](https://github.com/dosreislab/mcmc3r) -> Para **selección de modelos de reloj** usando el método de *stepping stones*
- Paquete de R [tbea](https://github.com/gaballench/tbea) -> Definir los **priors de calibración** e graficar los resultados del análisis
- [Tracer](https://beast.community/tracer) -> Para analizar los resultados de la corrida de ```MCMCtree``` y evaluar **convergencia**

Estos programas fueron instalados previamente en un ambiente de ```conda```. Para descargarlo, descomprimirlo y activarlo seguir las indicaciones a continuación:

```{bash, class.source='klippy_bash', eval=FALSE}
cd Minicurso_divtimes_colevol2026
```

```{bash, class.source='klippy_bash', eval=FALSE}
wget https://www.dropbox.com/scl/fi/ragg4mi17x6rko07s8feq/divtimes.tar.gz?rlkey=m0ih9gb7li0iy4y60p5cjuqzv&st=aynui2hb&dl=0
```

```{bash, class.source='klippy_bash', eval=FALSE}
tar -xzvf divtimes.tar.gz
```

```{bash, class.source='klippy_bash', eval=FALSE}
conda activate divtimes
```
### Datos:

- Necesitamos una filogenia previamente estimada, de hecho, solo la topología (i.e. las relaciones filogenéticas entre los taxones) puesto que vamos a estimar las longitudes de rama en tiempo absoluto a lo largo del análisis. Esa filogenia debe ser **enraizada** y totalmente resuelta, es decir, sin politomias (**binary tree**), y debe estar en formato Newick **sin longitudes de rama**. Detallaremos el formato del árbol más adelante.

- Alineamientos de AND, aminoácidos o morfología para informar las tasas de substitución. Generalmente se usan los mismos alineamientos que fueron usados para inferir la filogenia o un subconjunto de los mismos. En el segundo caso, es fundamental asegurarse de que todos los taxones incluidos en la filogenia estén también en el subconjunto de los alineamientos.

- Información de tiempo independiente para definir *constrains* temporales en algunos nodos de la filogenia (**calibration priors**). Esa información de tiempo será incluida directamente en el archivo del árbol como veremos más adelante.

Estos archivos están disponibles en el repositorio en la carpeta [data](https://github.com/spreinalesl/Minicurso_divtimes_colevol2026/tree/e878bc74706531b7a47e7a133e5f22130c5e899f/data). Para garantizar la estabilidad de los scripts incluidos en este tutorial, recomendamos fuertemente que la **estructura de carpetas y los nombres** tanto de las carpetas como de los archivos **no sean alterados**.

### Pasos del análisis:

Ya que tenemos el software y los datos requeridos para correr nuestros análisis, los pasos a seguir son:

- Establecer los *priors* de calibración [Tutorial1](http://htmlpreview.github.io/?https://github.com/spreinalesl/Minicurso_divtimes_colevol2026/master/tutorial1_calibpoints.html). Para esto necesitamos definir cuáles nodos van a ser calibrados, escoger la distribución estadística (y su respectivo conjunto de parámetros) que vamos a usar para informar el tiempo en cada uno de los nodos, y finalmente incluir esa información en el archivo del árbol.   

- Preparar el archivo que contiene los alineamientos.

- Configurar el **control file** de MCMCtree.

- Estimar el gradiente y la matriz Hesiana [Tutorial2]().

- Seleccionar el modelo de reloj que mejor se ajusta a mis datos [Tutorial3]().

- Correr las cadenas de ```MCMC``` para estimar los tiempos de divergencia [Tutorial4]().

- Revisar los resultados del análisis [Tutorial5]().
