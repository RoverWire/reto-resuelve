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

## Docker

Se requiere tener instalado docker y docker compose. Para levantar el contenedor solo debe de ir a consola y teclear:

```bash
$ docker-compose up
# Iniciará el proceso de creación del contenedor.
```

Para verificar el funcionamiento, acceda a por navegador a:

```text
GET http://localhost:9292/api/
# API de Prueba para Resuelve
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

## Endpoints

Actualmente existen dos endpoints, el primero requiere una variable `players_list` con una estructura de datos en el body, similar a la que se proporciona en las instrucciones. [Aquí puede encontrar un ejemplo](./spec/fixtures/v1_request.json).

La URL para el endpoint de la versión 1:

```text
POST http://localhost:9292/api/v1/payroll
```

El Segundo endpoint puede opcionalmente recibir un arreglo de configuraciones en un segundo parámetro llamado `teams_setup`. De igual manera pueden encontrar un [ejemplo de la llamada aquí](./spec/fixtures/v2_request.json).

```text
POST http://localhost:9292/api/v2/payroll
```

En ambos casos se valida la estructura del JSON así como el tipo de valores que tienen cada llave. Consulte los archivos de referencia mencionados anteriormente.

## Heroku

Alternativamente, este repositorio se encuentra en un worker de heroku y esta listo para recibir peticiones en la siguiente URL:

```text
POST https://api-reto-resuelve.herokuapp.com/api/v1/payroll

POST https://api-reto-resuelve.herokuapp.com/api/v2/payroll
```

Si desea acceder a la documentación vía swagger:

```text
GET https://api-reto-resuelve.herokuapp.com/api/swagger_doc
```

El worker se mantiene actualizado mediante github actions enlazando este repositorio a heroku.
