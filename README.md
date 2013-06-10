эвитерровый геолисп
===================

В тексте правил комиссий бывают такие проверки:

    check {
      includes_only(operating_carrier_iatas, 'AZ VE XM CT') and
      ( includes(city_iatas.first, 'MOW LED SVX') or
        (includes(city_iatas.first, 'IEV') and includes_only(city_iatas, 'IEV ROM MIL')) or
        (includes(city_iatas.first, 'TBS') and includes_only(city_iatas, 'TBS ROM')) or
        (includes(city_iatas.first, 'EVN') and includes_only(city_iatas, 'EVN ROM'))
      )
    }

Этот кусок кода на руби можно записать таким вот псевод-лиспом. Просто вернуть мне такую строку,
я ее сам разберу. И, скорее всего, я в базе именно ее, а не ruby, буду хранить в базе.

    (И

      (только
        оперирующие-перевозчики
        AZ VE XM CT)

      (ИЛИ

        (первый
          города
          MOW LED SVX)

        (И
          (первый
            города
            IEV)
          (только
            города
            IEV ROM MIL))

        (И
          (первый
            города
            TBS)
          (только
            города
            TBS ROM))

        (И
          (первый
            города
            EVN)
          (только
            города
            EVN ROM))))

Операции
--------

Три логические операции.

* И, ИЛИ (1..сколько угодно операндов)
* НЕ (1 операнд)

Четыре списковые операции.

* только
* любой
* первый
* последний

Принимают по два параметра-списка. Первый список всегда "готовый", а второй задается руками.

Готовые списки берутся из рекомендации.

* страны
* города
* аэропорты
* маркетинговые перевозчики
* оперирующие перевозчики
* номера рейсов
* континенты

Вводимые списки.

* иата стран
* иата городов
* иата аэропортов
* иаты перевозчиков
* номера рейсов
* (других не видел)

Первое время можно будет без всяких комплитеров, просто строки через пробел.
