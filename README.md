# Prueba Ingeniería Resuelve

[![Build Status](https://travis-ci.org/RoverWire/reto-resuelve.svg?branch=master)](https://travis-ci.org/RoverWire/reto-resuelve) [![Codacy Badge](https://app.codacy.com/project/badge/Grade/528d68f04e7f4c9c89eb1607e174707c)](https://www.codacy.com/manual/roverwire/reto-resuelve?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=RoverWire/reto-resuelve&amp;utm_campaign=Badge_Grade)

API creada con [Grape](http://www.ruby-grape.org) para responder las peticiones planteadas en el [ejercicio de backend](https://github.com/resuelve/prueba-ing-backend) de Resuelve.

## Requerimientos

- Ruby 2.4.10 < 2.7.1

El requerimiento mínimo es Ruby 2.4.10, sin embargo ha sido probado en versiones posteriores como 2.5.8 y 2.7.1. Puede ser instalado por medio de los repositorios oficiales o a través de [RVM](http://rvm.io/) o [RBENV](https://github.com/rbenv/rbenv).

## Instalación

Instalación de Ruby mediante RVM / RBENV, se usa el comando rvm o rbenv dependiendo de la herramienta previamente instalada:

```bash
# Instalar la versión que deseemos.
$ [rvm | rbenv] install 2.4.10

# Usar la versión instalada.
$ [rvm | rbenv] use 2.4.10
```

Configuración del proyecto:

```bash
# Clonar el repositorio del proyecto.
$ git clone git@github.com:RoverWire/reto-resuelve.git

# Instalar la gema bundler.
$ gem install bundle

# Descargar todas las gemas del proyecto.
$ bundle install
```

Para iniciar la aplicación:

```bash
$ bundle exec rackup
# Iniciará el servicio de la API y estará lista para recibir peticiones.
```

## Desarrollo

Para ejecutar en una máquina local:

```bash
$ bundle exec guard
# Iniciará la API y recargará la aplicación con los cambios de código.
# Ejecutará rubocop con cada recarga para validar calidad de código.
```

## Testing

Si desea ejecutar las pruebas unitarias, en consola escriba:

```bash
bundle exec rspec
```
