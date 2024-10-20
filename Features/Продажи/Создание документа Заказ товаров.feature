﻿#language: ru

@tree

Функционал: создание документа Заказ товаров

Как Администратор я хочу
создать документ Заказ товаров
чтобы проверить работоспособность документа

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Заказ товаров
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Когда открылось окно "Заказы товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'	
* Заполнение шапки документа
	И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"Все для дома\""
	Тогда элемент формы с именем 'Организация' стал равен "ООО \"Все для дома\""	
	И я нажимаю кнопку выбора у поля с именем 'Покупатель'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование"        |
		| "000000009" | "Животноводство ООО " |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда элемент формы с именем 'Покупатель' стал равен "Животноводство ООО "
	Тогда открылось окно "Заказ (создание) *"
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Большой"
	Тогда элемент формы с именем 'Склад' стал равен "Большой"
	И из выпадающего списка с именем 'ВидЦен' я выбираю точное значение "Розничная"
	Тогда элемент формы с именем 'ВидЦен' стал равен "Розничная"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
	Тогда элемент формы с именем 'Валюта' стал равен "Рубли"
	Когда открылось окно "Заказ (создание) *"
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000031" | "Босоножки"    |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000037" | "Доставка"     |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я завершаю редактирование строки
* Проверка заполнения табличной части
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '2 500,00' | '1'          | '2 500,00' |
		| 'Доставка'  | '300,00'   | ''           | '300,00'   |
	Когда открылось окно "Заказ (создание) *"
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Проверка создания документа		
	И таблица "Список" содержит строки :
		|'Номер'|
		|'$Номер$'|
	И я закрываю все окна клиентского приложения

Сценарий: Проверка расчета суммы документа при изменении количества и цены в товарах
* Открытие созданного документа
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И в таблице "Список" я перехожу к последней строке
	И в таблице 'Список' я выбираю текущую строку
* Изменение цены и количества
	И в таблице 'Товары' я перехожу к строке:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '2 500,00' | '1'          | '2 500,00' |
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "3 000,00"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' я выбираю текущую строку
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я увеличиваю значение
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "3"
	И в таблице 'Товары' я завершаю редактирование строки
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '3 000,00' | '3'          | '9 000,00' |
		| 'Доставка'  | '300,00'   | ''           | '300,00'   |
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд	
Сценарий: Проверка расчета суммы документа при изменении количества в услугах
* Изменение количества в услугах
	И В командном интерфейсе я выбираю "Продажи" "Заказы"
	Тогда открылось окно "Заказы товаров"
	И в таблице "Список" я перехожу к последней строке
	И в таблице 'Список' я выбираю текущую строку
	И в таблице 'Товары' я перехожу к строке:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Доставка'  | '300,00'   | ''           | '300,00'   |
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2"
	// Метод не может быть вызван для данного объекта (Количество)