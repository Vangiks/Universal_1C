﻿Функция ОчиститьКэшМетаданных() Экспорт
	
	ТекстЗапроса = "
    |taskkill /f /fi ""status ne NOT RESPONDING"" /im 1cv8.exe
    |CHOICE /N /T 5 /D Y
    |RMDIR ""%UserProfile%\\Local Settings\\Application Data\\1C\\1Cv82"" /s /q
    |";
        
    ИмяФайлаbat = ПолучитьИмяВременногоФайла("bat");
    Текст = Новый ТекстовыйДокумент;            
    Текст.УстановитьТекст(ТекстЗапроса);
    Текст.Записать(ИмяФайлаbat, КодировкаТекста.OEM, );
    ЗапуститьПриложение(ИмяФайлаbat); 
	
КонецФункции