
# Cómo configurar los servicios de contabilidad y nómina

Los componentes que contiene este repositorio son compatibles para sistemas Windows y Linux con el entorno de .net5 ,así también para .net framework exclusivo para Windows, esto con la finalidad de mantener 
una mejor experiencia con distintos sistemas operativos y entornos de desarrollo.


# Requisitos previos para Windows .Net framework
* Tener instalado IIS (Internet Information Services)
	
## Instalación del proveedor de servicios en IIS
* Abrir IIS
* Crear un sitio
	- Agregar Grupo de aplicación
* Copiar los componentes de la carpeta /iis_handler/bin de este repositorio,a una carpeta nombrada bin dentro de la carpeta física del grupo de aplicación(ej. /carpeta_física_grupo_de_aplicación/bin )
* Copiar el archivo Services.ashx se encuentra en /iis_handler/bin de este repositorio, a la carpeta física del grupo de aplicación
* Copiar los archivos de la carpeta configs que se encuentra en este repositorio hacia /carpeta_física_grupo_de_aplicación/bin
* Copiar los contenidos de la carpeta schemas que se encuentra en este repositorio hacia /carpeta_física_grupo_de_aplicación/bin/schemas
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

#### 1. Copiar archivos fuente
 - Copiar todo el contenido de la carpeta **src** de este repositorio, a la carpeta física donde se encuentran los binarios de **DevKron**.

#### 2. Configurar Conexión de base de datos

Guía: https://docs.induxsoft.net/es/productos/v12/devops/despliegue-instalacion.md

a la sección **Creación o conexión a la base de datos** dentro de la guía y sigue las instrucciones detalladas.

* Asegúrate de configurar correctamente el archivo **connections.xml**, el cual permite que el proveedor de servicios acceda a la base de datos.
Este archivo se encuentra en la ruta:
/carpeta_física_devkron/connections.xml

#### 3. Crear un sitio en /carpeta_de_devkron/web/.
Creación del sitio Web
Para crear el sitio Web a través del cual se accederá al sistema V12 use la herramienta 'createsite'.

 - Crear el sitio Web con la plantilla de sitio Web para V12 serie-e
```
./dkl createsite v12-serie.e "sudominio-o-host.com"
```

- Conectar sitio Web V12 a la base de datos
```
./dkl connectv12 "db=miconexion@grupoapps" "host=sudominio-o-host.com"
```

## Nota general
```
- Es importante tener presente que cualquier modificación en los archivos paths.cfg o server.devkron debe realizarse con pleno conocimiento de lo que se está cambiando, ya que estos archivos definen rutas y configuraciones críticas del servicio.

- Puede cambiar la ubicación de los archivos de esquema(schema) en el archivo paths.cfg.

- (opcional) Configurar el archivo server.devkron (en este archivo se define la ubicación de los componentes del servicio de cada aplicación por defecto viene indicándole que se encuentran en /carpeta_física_devkron)

- Vaciar la caché de los DNS en Windows: ipconfig /flushdns
```
