
&НаКлиенте
Процедура Обновить(Команда)
	
	СогласованнаяСкидкаПриИзмененииРасчет();
	
КонецПроцедуры

&НаКлиенте
Процедура СогласованнаяСкидкаПриИзменении(Элемент)
		
	Если Объект.Товары.Количество() > 0 Или
		Объект.Услуги.Количество()> 0 Тогда
		
		СогласованнаяСкидкаИзменение();
			
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Асинх Процедура СогласованнаяСкидкаИзменение()
	
	ТекстВопроса = "Внесены изменения скидки. Выполнить Перерасчет?";
	ВариантыОтвета = Новый СписокЗначений;
	ВариантыОтвета.Добавить(1, "Да");
	ВариантыОтвета.Добавить(2, "Нет");
	ОтветПользователя = Ждать ВопросАсинх(ТекстВопроса, ВариантыОтвета);
	
	Если ОтветПользователя = 1 Тогда
		СогласованнаяСкидкаПриИзмененииРасчет();
	ИначеЕсли ОтветПользователя = 2 Тогда
		Возврат;
	КонецЕсли;
	
	
КонецПроцедуры

&НаКлиенте
Процедура СогласованнаяСкидкаПриИзмененииРасчет()
	
	Если Объект.Товары.Количество() > 0 Тогда
		Для Каждого Строка Из Объект.Товары Цикл
			РассчитатьСуммуСтроки(Строка);
		КонецЦикла;
	КонецЕсли;
	
	Если Объект.Услуги.Количество() > 0 Тогда
		Для Каждого Строка Из Объект.Услуги Цикл
			РассчитатьСуммуСтроки(Строка);
		КонецЦикла;
	КонецЕсли;

	
КонецПроцедуры

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	//Добавление расчета по согласованной скидке
	
	
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	

		СуммаСтроки = ТекущиеДанные.Цена * ТекущиеДанные.Количество;
	Если ЗначениеЗаполнено(ТекущиеДанные.Скидка) Тогда
		СкидкаСтроки = СуммаСтроки * ТекущиеДанные.Скидка / 100;
	Иначе
		СкидкаСтроки = 0;
	КонецЕсли;
	
	Если ЗначениеЗаполнено(СогласованнаяСкидка) Тогда
		СкидкаДокумента = СуммаСтроки * СогласованнаяСкидка / 100;
	Иначе
		СкидкаДокумента = 0;
	КонецЕсли;
	
	Скидка = СкидкаДокумента + СкидкаСтроки;
	Если Скидка <= СуммаСтроки Тогда
		ТекущиеДанные.Сумма = СуммаСтроки - Скидка;
	Иначе
		
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Поле = "ЭтотОбъект";
		Сообщение.ПутьКДанным = ТекущиеДанные;
		Сообщение.Текст = "По данной номенклатуре превышена скидка!";
		Сообщение.Сообщить();
		ТекущиеДанные.Сумма = 0;
		Возврат;
	КонецЕсли;
	
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
