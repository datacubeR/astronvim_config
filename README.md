# Configuración AstroNvim

Esta es mi configuración de Neovim, la cual he ido creando a lo largo de meses de prueba, y que he decidido compartir con la comunidad.
Luego de probar varios frameworks: 

* LunarVim
* NVChad
* Neovim
* Lazyvim
* Spacevim

Finalmente me he decidido por utilizar `AstroNvim`, esto porque considero que es una configuración muy completa, y que además es muy fácil de personalizar, ya que está basada en Lua, y no en Vimscript. Además de tener una pre-configuración, y muy buena documentación (dentro de lo que se puede esperar en Neovim). Algunas de las cosas que más me gustaron:

* Instalación de paquetes mediante [lazy.nvim.](https://github.com/folke/lazy.nvim)
* Soporte para LSP (Autocompletado y reconocimiento de errores para ciertos lenguajes)
* Soporte para Treesitter, para el Highlighting de ciertos lenguajes.
* Integración directa con Telescope, para la búsqueda de archivos, buffers, etc.
* Soporte para el manejo de pestañas, y ventanas.
* Soporte para el manejo de Git, con Git Signs, y Git Blame.
* Soporte para desarrollo interactivo con Jupyter (aunque esto es un plugin que puede ser usado en cualquier configuración de Neovim).

## Instalación

Para poder utilizar Astronvim se debe instalar [Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) para luego seguir las siguientes [instrucciones](https://astronvim.com/). 
> Debo decir que en realidad yo instalé Neovim siguiendo el siguiente [video](https://www.youtube.com/watch?v=2wapxsfzLho), el cuál es bastante más completo para las Distros de Ubuntu. Obviamente instalar sólo siguiendo las instrucciones es demasiado escueto. 

Una vez instalado esto, basta con ejecutar el siguiente comando para descargar mi configuración:

```bash
git clone git@github.com:datacubeR/astronvim_config.git ~/.config/nvim/lua/user
```

## Modificaciones

En esta configuración, modifiqué algunos aspectos de AstroNvim para dejarlo más a mi gusto. Dentro de estas modificaciones están:

* Cambio de Pestañas con `<S-h>` y `<S-L>`.
* Estética de Statusline de NVChad.
* Cierre de Pestañas tipo LunarVim con `<leader>x` y `<leader>X` para forzar.
* Guardado con <C-s> tanto en Modo Normal como Insert. 
* Sólo algunos Menú de Which Key están activados. 
TODO: Me faltan asignar algunos atajos de vim-jukit. 

## Componentes

AstroNvim incluye una gran cantidad de funcionalidades. Lo que menciono acá es lo que está agregado por mí. Mi configuración está pensada principalmente como un entorno de desarrollo para Python, Latex y Markdown además de entregar mejoras a lo que  ya de por sí entrega Neovim.  

### Generales

* `modes.nvim` permite cambiar el color del cursor dependiendo del modo en el que se encuentre, lo cual facilita el entender en qué parte se está trabajando. En especial para cuando tengo que hacer clases. 
* `targets.vim` permite aplicar comandos de vim de manera más flexible.
* `vim-surround` permite agregar, cambiar o eliminar paréntesis, corchetes, comillas, etc.
* `todo-comments.nvim` permite marcar comentarios como TODO, FIXME, etc. muy parecido a better-comments de VSCode, pero agrega también compatibilidad con Telescope. 
* `leap.nvim` permite movilizarse entre palabras de manera más rápida buscando por bigramas. 

### Python

Python es el principial lenguaje que utilizo para programar y para el desarrollo de Proyectos de Data Science y Machine Learning. 

Por lo tanto utilizo los siguientes plugins:

* `pyright` como language server, además de `black` y `isort` como formatters integrados. 
* `Vimjas/vim-python-pep8-indent` como indentador de código. (Además corrijo problema de Treesitter para tener indentación correcta).
* [copilot.lua](https://github.com/zbirenbaum/copilot.lua) para tener Github Copilot. 
* [vim-jukit](https://github.com/luk400/vim-jukit) para el desarrollo interactivo tipo Jupyter. Es por lejos el mejor plugin que he encontrado para trabajar con Jupyter. 

### Latex

Debido a mi Doctorado, es que ya he tenido que trabajar mucho con Latex. Instalar Latex es un cacho, por eso espero poder documentar esto de la mejor manera: 

Primero, se debe instalar TexLive que es el repositorio de Librerías de Latex, lo cual se hace siguiendo las siguientes [instrucciones](https://www.tug.org/texlive/quickinstall.html). Adicionalmente se debe instalar [latexmk](https://howtoinstall.co/es/latexmk) el cual permitirá la compilación de Latex.

> Es importante mencionar que se requieren contar con Perl en ambos casos. Lo bueno es que las distribuciones derivadas Ubuntu lo traen previamente instalado. 

* `vimtex` permite el desarrollo de Latex en Neovim.

> Otro punto es que mi configuración en particular utiliza zathura para visualizar PDFs. Esto es opcional.


### Markdown

Por mi blog suelo utilizar mucho Markdown, por lo tanto requiero de ciertas funcionalidades: 

* `markdown-preview.nvim` permite previsualizar Markdown en el navegador.
* `markdowny.nvim` permite algunos shortcuts especialmente para Negritas, Cursivas y Código.

