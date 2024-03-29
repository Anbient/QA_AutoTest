﻿#language: ru

@tree

Функционал: Добавления картинки в карточку товара

Как Менеджер по продажам я хочу
добавить картинки в карточку товара 
чтобы у товаров было визуальное отображение

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка добавления картинки в карточку товара
* Открытие карточки товара
	И В командном интерфейсе я выбираю 'Товарные запасы' 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Артикул' | 'Код'       | 'Наименование' | 'Поставщик'   |
		| 'H987'    | '000000029' | 'Хлеб'         | 'Мосхлеб ОАО' |
	И в таблице "Список" я выбираю текущую строку
	Когда открылось окно 'Хлеб (Товар)'
* Добавление картинки
	И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
	Тогда открылось окно 'Файлы'
* Поиск и выбор уже добавленной картинки, либо создание новой
	Если в таблице "Список" есть строка Тогда
		| 'Наименование' |
		| 'Хлеб'       |
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Хлеб'         |
		И в таблице "Список" я выбираю текущую строку
	Иначе 
		Тогда
			И я нажимаю на кнопку с именем 'ФормаСоздать'
			Тогда открылось окно 'Файл (создание)'
			И в поле с именем 'Наименование' я ввожу текст 'Хлеб'
			И я выбираю файл 'C:\Users\avatchanin\Documents\GitHub\QA_AutoTest\Features\Final Module\Bread.png'
			И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'Хлеб (Файл)' в течение 20 секунд
			Тогда открылось окно 'Файлы'
			И в таблице "Список" я выбираю текущую строку

//	Тогда у элемента формы с именем "Картинка" текст редактирования стал равен 'e1cib/data/Справочник.ХранимыеФайлы.ДанныеФайла?ref=bbc1005056b9d65411ee5d017c9c69fd'
			