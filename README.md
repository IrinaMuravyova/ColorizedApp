<p align="center">
      <img src="https://i.ibb.co/qmqv7ZY/2024-04-13-17-42-50.png" width="726">
</p>

<p align="center">
   <img src="https://img.shields.io/badge/Engine-XCode v15.3-blueviolet">
   <img src="https://img.shields.io/badge/Version-v1.0-blue">
   <img src="https://img.shields.io/badge/License-MIT-green">
</p>

## About
Учебное приложение, напоминающее эквалйзер. Настройка цвета основного экрана через указание RGB параметров.

**В проекте используются:**

* переходы по segue
* delegate
* цвет в RGB
* сихнронное обновление значений элементов интерфейса
* NavigationController
* работа с клавиатурой
* алерты


### Техническое задание к проекту:

Необходимо создать приложение из двух экранов.
Второй экран - настройка цвета. 
Первый экран - отображает последний настроенный цвет, используйте для этого делегирование. (при старте белый)
Раместить кнопку вызова окна настройки в NavigationBar первого окна.

Экран настроек должен содержать:
 - окно preview
 - слайдеры RGB и labels к ним
 - текстовые окна для задания значений сладеров посредством ввода с клавиатуры
 - при движении слайдеров не должно быть "скачков" элементов интерфейса
 - значения в labels и в текстовых полях обновляются синхронно по мере движения слайжеров
 - кнопку закрытия окна настроек(при закрытии цвет из preview передается на основной экран)

Сохранять цвет при закрытии приложения не нужно.

![screenshot of sample](https://i.ibb.co/8msQ6Gp/Colorizer.png)

## Documentation

### ViewControllers:

* StartViewController - при старте белый, далее совпадает с цветом окна preview экрана настроек.
     
  
* SettingsViewController - настройка цвета экрана в формате RGB

       
  #### Methods:
  
    ***setupColorView*** - в окне preview показывает цвет согласно указанным значениям RGB

    ***setValue*** - один метод для Labels, TextFields, Sliders. В зависимости от того, для какого элемента вызывается устанавливает значение элемента интерфейса.

    ***string*** - форматирует значение, выводимое в labels

    ***showAlert*** - вызывает алерт, если в текстовое поле введено не корректное значение


## Developers

- [Irina Muravyova](https://github.com/IrinaMuravyova)

## License
Project Colorizer is distributed under the MIT license.
