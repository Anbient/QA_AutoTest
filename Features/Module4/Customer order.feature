﻿#language: ru

@tree

Функционал: Заказ покупателя

Как Менеджер по продажам я хочу
создать документ Заказ покупателя 
чтобы зафиксировать покупку в базе данных

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка полей документа Заказ покупателя
	* Открытие документа Заказ покупателя
		Дано Я открываю навигационную ссылку "e1cib/data/Document.SalesOrder?ref=b76cbacb2511e57d11ebeab0dfce222c"
		И я нажимаю на гиперссылку с именем "DecorationGroupTitleCollapsedLabel"
	* Заполнения поля "Партнер" и проверка полей "Контрагент" и "Соглашение"
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'         |
			| '10'  | 'Розничный покупатель' |
		И в таблице "List" я выбираю текущую строку
		Когда открылось окно 'Табличная часть товаров будет обновлена'
			И я нажимаю на кнопку с именем 'FormOK'		
		Тогда элемент формы с именем "LegalName" стал равен 'Розничный покупатель'
		Тогда элемент формы с именем "Agreement" стал равен 'Розничное'	
	* Проверка полей "Контрагент" и "Соглашение" с пустым полем "Партнер"
		И в поле с именем 'Partner' я ввожу текст ''		
		И Проверяю шаги на Исключение:
			|'И элемент формы с именем "LegalName" доступен'|
		Тогда элемент формы с именем "Agreement" стал равен ''
		