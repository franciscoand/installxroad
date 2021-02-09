# http://github.com/nordic-institute/X-Road/blob/develop/doc/Manuals/ig-cs_x-road_6_central_server_installation_guide.md
# Preparar el sistema operativo
# Agregar usuario y asignar clave
sudo adduser central
#sudo useradd central
#Introducir clave luego de esta instruccion
#sudo passwd central
# Establecer la configuración regional del sistema operativo
# Agregar la siguiente linea al archivo de entorno: LC_ALL=en_US.UTF-8
#sudo nano /etc/environment
# Agregar linea al final
sudo echo 'LC_ALL=en_US.UTF-8' >> /etc/environment
# Agregar carpeta con archivos compilados al archivo del repositorio de UBUNTU.  Poner siguiente linea al inicio:
# deb [trusted=yes] file:///home/ubuntu/ubuntu18.04
#sudo nano /etc/apt/sources.list
#sudo echo 'deb [trusted=yes] file:///home/ubuntu/ubuntu18.04' >> /etc/apt/sources.list
# Agregar linea al principio
sed -i 'deb [trusted=yes] file:///home/ubuntu/ubuntu18.04' /etc/apt/sources.list
# Descargar compilados
wget https://github.com/andcolombia/XROAD-CO/releases/download/6.24.1-CO-Ubuntu/ubuntu18.04.zip
# Descomprimir compilados
#unzip compilados-20201224T152509Z-001.zip
unzip ubuntu18.04.zip
# Ingresar a carpeta de compilados
cd ubuntu18.04
# Leer compilados
#sudo apt-get install dpkg-dev
sudo apt-get --assume-yes install dpkg-dev
# Leer compilados y crear resumen
dpkg-scanpackages . >Packages
#sudo apt install acl curl apt-transport-https locales aptitude software-properties-common
sudo apt --assume-yes install acl curl apt-transport-https locales aptitude software-properties-common
# Actualizar
sudo apt-get update
#  Asegurarse de que ls
#los paquetes locales y software-properties-common estan presentes
#sudo apt-get install locales software-properties-common
sudo apt-get --assume-yes install locales software-properties-common
# Instalar los paquetes de posgresql (Cliente y Servidor)
#sudo apt install postgresql postgresql-contrib
# Agregar repositorio de paquetes Java
curl https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo apt-add-repository -y "deb https://adoptopenjdk.jfrog.io/adoptopenjdk/deb $(lsb_release -sc) main"
# Instalar JRE y fijarlo como la version de Java JDK 8 por defecto
#sudo apt install adoptopenjdk-8-hotspot-jre
sudo apt --assume-yes install adoptopenjdk-8-hotspot-jre
sudo update-java-alternatives -s adoptopenjdk-8-hotspot-jre-amd64
# Actualizar nuevamente, antes de instalar
sudo apt-get update
# Instalar el servidor central
#$sudo apt-get install xroad-centralserver
sudo apt-get --assume-yes install xroad-centralserver
#sudo apt install xroad-centralserver