# https://x-tee.ee/docs/test/xroad/ig-ss_x-road_v6_security_server_installation_guide.html
# Preparar el sistema operativo
# Agregar usuario y asignar clave
sudo adduser seguridad
#sudo useradd seguridad
#Introducir clave luego de esta instruccion
#sudo passwd seguridad
# Establecer la configuración regional de idioma en el ambiente del sistema operativo
# Agregar la siguiente linea al archivo de entorno: LC_ALL=en_US.UTF-8
#sudo nano /etc/environment
sudo echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
#LC_ALL=en_US.UTF-8
# Agregar carpeta con archivos compilados al archivo del repositorio de UBUNTU.  Poner siguiente linea al inicio:
# deb [trusted=yes] file:///home/ubuntu/ubuntu18.04 ./
#sudo nano /etc/apt/sources.list
tac /etc/apt/sources.list > /tmp/temp; echo "deb [trusted=yes] file:///home/ubuntu/ubuntu18.04 ./" >> /tmp/temp; tac /tmp/temp > /etc/apt/sources.list
# Descargar compilados
wget https://github.com/andcolombia/XROAD-CO/releases/download/6.24.1-CO-Ubuntu/ubuntu18.04.zip
# Descomprimir compilados
unzip ubuntu18.04.zip
# Ingresar a carpeta de compilados
cd ubuntu18.04
# Leer compilados
sudo apt-get install dpkg-dev
# Leer compilados y crear resumen
dpkg-scanpackages . >Packages
sudo apt install acl curl apt-transport-https locales aptitude software-properties-common
#  Asegurarse de que los paquetes locales y software-properties-common estan presentes
sudo apt-get install locales software-properties-common
sudo locale-gen en_US.UTF-8
# Asegurarse de que la zona horaria es correcta
#timedatectl
# Si la zona horaria no es correcta, actualizarla desde la lista
#timedatectl list-timezones
# Actualizar
sudo apt-get update
# Instalar el servidor de seguridad
sudo apt-get install xroad-securityserver
# sudo apt install xroad-securityserver