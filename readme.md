# Cómo configurar el servicios de contabilidad y nómina

Los componentes que contiene el repositorio [svr-se-contabilidad-nomina](https://github.com/Induxsoft/svr-se-contabilidad-nomina)
es compatible para sistemas Windows y Linux con el entorno de .net5 ,así también para .net framework exclusivo para Windows, esto con la finalidad de mantener 
una mejor experiencia con distintos sistemas operativos y entornos de desarrollo.


# Explicación breve de su funcionalidad y ventajas del servicio
El servicio se encarga de recibir las peticiones y retornar las respuestas de acuerdo a la solicitud, con ayuda del proveedor de servicios es muy sencillo realizar
un CRUDL(Create, Read, Update, Delete,List) ya que solo se basa en las entidades enviadas en solicitud.

Ambas aplicaciones utilizan el mismo proveedor de servicios con la finalidad de mantener controlado los procesos de invocación del servicio, así como
también las respuestas que hay entre la aplicación y el proveedor de servicios.

# Requisitos previos para Windows .Net framework
* Tener instalado iis (Internet Information Services)
	
##Instalación del proveedor de servicios en iis
* Abrir iis
* Crear un sitio
	- Agregar Grupo de aplicación
* Copiar los componentes de la carpeta /iis_handler/bin del repositorio [svr-se-contabilidad-nomina] a la carpeta física del grupo de aplicación
* configurar el archivo paths.cfg (la configuración de este archivo es muy importante para el proveedor de servicios ya de ahí toma las rutas de configuración para su funcionamiento)


