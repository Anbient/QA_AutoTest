﻿#language: ru

@tree

Функционал: продажи товара

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка документа Продажи товаров
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И в таблице "Список" я перехожу к строке:
		| 'Дата'               | 'Номер'     |
		| '19.12.2020 8:28:00' | '000000100' |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И таблица "Товары" стала равной:
		| 'N' | 'Товар'    | 'Цена'   | 'Количество' | 'Сумма'    |
		| '1' | 'Колбаса'  | '330,00' | '10,00'      | '3 300,00' |
		| '2' | 'Хлеб'     | '25,00'  | '5,00'       | '125,00'   |
		| '3' | 'Торт '    | '250,00' | '9,00'       | '2 250,00' |
		| '4' | 'Доставка' | '250,00' | '1,00'       | '250,00'   |
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '25'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '5 925'
	И я запоминаю значение поля "Номер" как "$$Номер$$"
	И я закрываю все окна клиентского приложения

Сценарий: Проверка движений документа
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И в таблице "Список" я перехожу к строке:
		| 'Дата'               | 'Номер'     |
		| '19.12.2020 8:28:00' | '$$Номер$$' |
	И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
	И в таблице "Список" я выбираю текущую строку
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'	
	И в таблице "Список" количество строк "равно" 0
	И В текущем окне я нажимаю кнопку командного интерфейса 'Основное'
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И Пауза 10
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
	Тогда таблица "Список" стала равной:
		| 'Регистратор'                             | 'Номер строки' | 'Контрагент'                | 'Сумма'    | 'Валюта' |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '1'            | 'Магазин "Бытовая техника"' | '5 925,00' | 'Рубли'  |
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
	Тогда таблица "Список" стала равной:
		| 'Регистратор'                             | 'Номер строки' | 'Покупатель'                | 'Товар'    | 'Количество' | 'Сумма'    |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '1'            | 'Магазин "Бытовая техника"' | 'Колбаса'  | '10,00'      | '3 300,00' |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '2'            | 'Магазин "Бытовая техника"' | 'Хлеб'     | '5,00'       | '125,00'   |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '3'            | 'Магазин "Бытовая техника"' | 'Торт '    | '9,00'       | '2 250,00' |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '4'            | 'Магазин "Бытовая техника"' | 'Доставка' | '1,00'       | '250,00'   |
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
	Тогда таблица "Список" стала равной:
		| 'Регистратор'                             | 'Номер строки' | 'Товар'   | 'Склад'               | 'Количество' |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '1'            | 'Колбаса' | 'Склад отдела продаж' | '10,00'      |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '2'            | 'Хлеб'    | 'Склад отдела продаж' | '5,00'       |
		| 'Продажа 000000100 от 19.12.2020 8:28:00' | '3'            | 'Торт '   | 'Склад отдела продаж' | '9,00'       |
	И я закрываю все окна клиентского приложения

Сценарий: Проверка печатной формы расходной накладной
	И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
	И в таблице "Список" я перехожу к строке:
		| 'Дата'               | 'Номер'     |
		| '19.12.2020 8:28:00' | '$$Номер$$' |
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	И табличный документ "SpreadsheetDocument" равен макету "Sales Invoice"

