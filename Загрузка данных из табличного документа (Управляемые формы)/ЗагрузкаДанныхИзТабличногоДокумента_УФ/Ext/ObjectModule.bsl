﻿
Функция СведенияОВнешнейОбработке(ВторойВариантРегистрации = Ложь, ПараметрыРегистрации = Неопределено) Экспорт
	
	Выполнить("ПараметрыРегистрации = ДополнительныеОтчетыИОбработки.СведенияОВнешнейОбработке(""2.1.3.1"")");	
	
	ПараметрыРегистрации.Версия = "2.9";
	ПараметрыРегистрации.БезопасныйРежим = Истина;
	ПараметрыРегистрации.Информация = "";
	
	Если ВторойВариантРегистрации Тогда	
		Выполнить("ПараметрыРегистрации.Вид = ДополнительныеОтчетыИОбработкиКлиентСервер.ВидОбработкиДополнительнаяОбработка()");
		ПараметрыРегистрации.Наименование = "Загрузка данных из табличного документа";
		
		НоваяКоманда = ПараметрыРегистрации.Команды.Добавить();
		НоваяКоманда.Представление = "Загрузка данных из табличного документа";
		НоваяКоманда.Идентификатор = "ЗаполнитьДанныхИзТабличногоДокумента";
		Выполнить("НоваяКоманда.Использование = ДополнительныеОтчетыИОбработкиКлиентСервер.ТипКомандыОткрытиеФормы()");
		НоваяКоманда.ПоказыватьОповещение = Истина;	
	Иначе	
		Выполнить("ПараметрыРегистрации.Вид = ДополнительныеОтчетыИОбработкиКлиентСервер.ВидОбработкиЗаполнениеОбъекта()");
		ПараметрыРегистрации.Наименование = "Заполнение табличной части из табличного документа";
				
		НоваяКоманда = ПараметрыРегистрации.Команды.Добавить();
		НоваяКоманда.Представление = "Заполнение табличной части из табличного документа";
		НоваяКоманда.Идентификатор = "ЗаполнитьДокументИзТабличногоДокумента";
		Выполнить("НоваяКоманда.Использование = ДополнительныеОтчетыИОбработкиКлиентСервер.ТипКомандыОткрытиеФормы()");
		НоваяКоманда.ПоказыватьОповещение = Истина;
	КонецЕсли;

	Возврат ПараметрыРегистрации;
	
КонецФункции
 
Процедура ВыполнитьКоманду(ИмяКоманды, ОбъектыНазначения, ПараметрыВыполнения) Экспорт
	
	ПараметрыРегистрации = СведенияОВнешнейОбработке();
	ПараметрыРегистрации.Команды.Колонки.Идентификатор.Имя = "ИмяКоманды";
	ЭтаКоманда = ПараметрыРегистрации.Команды.Найти(ИмяКоманды, "ИмяКоманды");
	Если ЭтаКоманда = Неопределено Тогда
		Выполнить(" ВызватьИсключение СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
			| НСтр(""ru = 'Команда ""%1"" не поддерживается обработкой ""%2""'""),
			| ИмяКоманды,
			| Метаданные().Представление()); "); 
	КонецЕсли;
	
КонецПроцедуры

