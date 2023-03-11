
# Cómo configurar los servicios de contabilidad y nómina

Los componentes que contiene este repositorio son compatibles para sistemas Windows y Linux con el entorno de .net5 ,así también para .net framework exclusivo para Windows, esto con la finalidad de mantener 
una mejor experiencia con distintos sistemas operativos y entornos de desarrollo.


# Requisitos previos para Windows .Net framework
* Tener instalado iis (Internet Information Services)
	
## Instalación del proveedor de servicios en iis
* Abrir iis
* Crear un sitio
	- Agregar Grupo de aplicación
* Copiar los componentes de la carpeta /iis_handler/bin de este repositorio,a una carpeta nombrada bin dentro de la carpeta física del grupo de aplicación(ej. /carpeta_física_grupo_de_aplicación/bin )
* Copiar el archivo Services.ashx se encuentra en /iis_handler/bin de este repositorio, a la carpeta física del grupo de aplicación
* Copiar los archivos de la carpeta configs que se encuentra en este repositorio hacia /carpeta_física_grupo_de_aplicación/bin
* Copiar los archivos de la carpeta schemas que se encuentra en este repositorio hacia /carpeta_física_grupo_de_aplicación/bin/schemas
	* Puede cambiar la ubicación del schemas en el archivo paths.cfg asi también otras configuraciones
* (opcional) Configurar el archivo server.devkron (en este archivo se define la ubicación de los componentes del servicio de cada aplicación por defecto viene indicandole que se encuentran en /carpeta_física_grupo_aplicación/bin)
* Configurar el archivo connections.xml  para que el proveedor de servicio pueda acceder a la base de datos(este archivo se encuentra ubicado en /carpeta_física_grupo_aplicación/bin)

# Ejemplo de invocación del servicio
- http(s)://sitio/name_grupo_aplicacion/Services.ashx?app=myapp&db=mydb


## Requisitos previos para Windows/Linux .Net5
* Tener instalado un servidor web(nginx)
* Tener Descargado devkron para .net5

```Link de descarga para windows:```https://devkron.org/descargas/devkron-win-x64.zip 

```Link de descarga para linux:```https://devkron.org/descargas/devkron-linux-x64.zip

```Cómo configurar devkron con nginx```https://docs.induxsoft.net/es/devkron/Guias-paso-a-paso/nginx-fastcgi.md

## Instalación del proveedor de servicios en Windows/Linux con devkron
* Copiar los componentes de la carpeta /devkron_handler/bin de este repositorio, a la carpeta física donde se encuentran los binarios de devkron
* Crear una carpeta en /carpeta_de_devkron/web/ con el nombre del host a utilizar 
* Colocar en la carpeta del host el archivo svc-rpc-stp.dkl que se encuentra en /devkron_handler/web 
* Copiar los archivos de la carpeta configs que se encuentra en este repositorio hacia /carpeta_física_devkron
* Copiar los archivos de la carpeta schemas que se encuentra en este repositorio hacia /carpeta_física_devkron
* (opcional) Configurar el archivo server.devkron (en este archivo se define la ubicación de los componentes del servicio de cada aplicación por defecto viene indicandole que se encuentran en /carpeta_física_devkron)
* Configurar el archivo connections.xml  para que el proveedor de servicio pueda acceder a la base de datos(este archivo se encuentra ubicado en /carpeta_física_devkron)

# Ejemplo de invocación del servicio
- http(s)://sitio/svc-rpc-stp.dk?app=myapp&db=mydb

## Nota general
```
Debe tener presente que los archivo de la carpeta configs son sumamente importante para el proveedor de servicios 
```
