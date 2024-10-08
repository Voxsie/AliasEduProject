//
//  Cities.swift
//  AliasApp
//
//  Created by Илья Желтиков on 18.05.2023.
//

import Foundation

extension WordPackManager {
    func getCitiesWords() -> [Word] {
        return [
            Word(english: "Moscow", russian: "Москва"),
            Word(english: "Saint Petersburg", russian: "Санкт-Петербург"),
            Word(english: "Novosibirsk", russian: "Новосибирск"),
            Word(english: "Yekaterinburg", russian: "Екатеринбург"),
            Word(english: "Nizhny Novgorod", russian: "Нижний Новгород"),
            Word(english: "Kazan", russian: "Казань"),
            Word(english: "Chelyabinsk", russian: "Челябинск"),
            Word(english: "Omsk", russian: "Омск"),
            Word(english: "Samara", russian: "Самара"),
            Word(english: "Rostov-on-Don", russian: "Ростов-на-Дону"),
            Word(english: "Ufa", russian: "Уфа"),
            Word(english: "Krasnoyarsk", russian: "Красноярск"),
            Word(english: "Voronezh", russian: "Воронеж"),
            Word(english: "Perm", russian: "Пермь"),
            Word(english: "Volgograd", russian: "Волгоград"),
            Word(english: "Krasnodar", russian: "Краснодар"),
            Word(english: "Saratov", russian: "Саратов"),
            Word(english: "Tyumen", russian: "Тюмень"),
            Word(english: "Tolyatti", russian: "Тольятти"),
            Word(english: "Izhevsk", russian: "Ижевск"),
            Word(english: "Barnaul", russian: "Барнаул"),
            Word(english: "Ulyanovsk", russian: "Ульяновск"),
            Word(english: "Vladivostok", russian: "Владивосток"),
            Word(english: "Yaroslavl", russian: "Ярославль"),
            Word(english: "Irkutsk", russian: "Иркутск"),
            Word(english: "Khabarovsk", russian: "Хабаровск"),
            Word(english: "Orenburg", russian: "Оренбург"),
            Word(english: "Novokuznetsk", russian: "Новокузнецк"),
            Word(english: "Kemerovo", russian: "Кемерово"),
            Word(english: "Ryazan", russian: "Рязань"),
            Word(english: "Tomsk", russian: "Томск"),
            Word(english: "Astrakhan", russian: "Астрахань"),
            Word(english: "Penza", russian: "Пенза"),
            Word(english: "Naberezhnye Chelny", russian: "Набережные Челны"),
            Word(english: "Lipetsk", russian: "Липецк"),
            Word(english: "Kirov", russian: "Киров"),
            Word(english: "Cheboksary", russian: "Чебоксары"),
            Word(english: "Balashikha", russian: "Балашиха"),
            Word(english: "Kaliningrad", russian: "Калининград"),
            Word(english: "Yoshkar-Ola", russian: "Йошкар-Ола"),
            Word(english: "Tula", russian: "Тула"),
            Word(english: "Kursk", russian: "Курск"),
            Word(english: "Sochi", russian: "Сочи"),
            Word(english: "Stavropol", russian: "Ставрополь"),
            Word(english: "Magnitogorsk", russian: "Магнитогорск"),
            Word(english: "Ivanovo", russian: "Иваново"),
            Word(english: "Belgorod", russian: "Белгород"),
            Word(english: "Bryansk", russian: "Брянск"),
            Word(english: "Surgut", russian: "Сургут"),
            Word(english: "Vladimir", russian: "Владимир"),
            Word(english: "Arkhangelsk", russian: "Архангельск"),
            Word(english: "Kaluga", russian: "Калуга"),
            Word(english: "Smolensk", russian: "Смоленск"),
            Word(english: "Chita", russian: "Чита"),
            Word(english: "Oryol", russian: "Орёл"),
            Word(english: "Saransk", russian: "Саранск"),
            Word(english: "Volzhsky", russian: "Волжский"),
            Word(english: "Vladikavkaz", russian: "Владикавказ"),
            Word(english: "Podolsk", russian: "Подольск"),
            Word(english: "Murmansk", russian: "Мурманск"),
            Word(english: "Taganrog", russian: "Таганрог"),
            Word(english: "Khimki", russian: "Химки"),
            Word(english: "Krasnogorsk", russian: "Красногорск"),
            Word(english: "Almetyevsk", russian: "Альметьевск"),
            Word(english: "Mytishchi", russian: "Мытищи"),
            Word(english: "Kopeysk", russian: "Копейск"),
            Word(english: "Tver", russian: "Тверь"),
            Word(english: "Nizhnekamsk", russian: "Нижнекамск"),
            Word(english: "Sterlitamak", russian: "Стерлитамак"),
            Word(english: "Lyubertsy", russian: "Люберцы"),
            Word(english: "Balakovo", russian: "Балаково"),
            Word(english: "Korolev", russian: "Королев"),
            Word(english: "Novorossiysk", russian: "Новороссийск"),
            Word(english: "Pskov", russian: "Псков"),
            Word(english: "Engels", russian: "Энгельс"),
            Word(english: "Kislovodsk", russian: "Кисловодск"),
            Word(english: "Rybinsk", russian: "Рыбинск"),
            Word(english: "Nizhny Tagil", russian: "Нижний Тагил"),
            Word(english: "Norilsk", russian: "Норильск"),
            Word(english: "Syktyvkar", russian: "Сыктывкар"),
            Word(english: "Derbent", russian: "Дербент"),
            Word(english: "Nalchik", russian: "Нальчик"),
            Word(english: "Blagoveshchensk", russian: "Благовещенск"),
            Word(english: "Vladimir", russian: "Владимир"),
            Word(english: "Orekhovo-Zuevo", russian: "Орехово-Зуево"),
            Word(english: "Khimki", russian: "Химки"),
            Word(english: "Khasavyurt", russian: "Хасавюрт"),
            Word(english: "Kamensk-Uralsky", russian: "Каменск-Уральский"),
            Word(english: "Novocherkassk", russian: "Новочеркасск"),
            Word(english: "Kovrov", russian: "Ковров"),
            Word(english: "Shakhty", russian: "Шахты"),
            Word(english: "Elektrostal", russian: "Электросталь"),
            Word(english: "Miass", russian: "Миасс"),
            Word(english: "Nakhodka", russian: "Находка"),
            Word(english: "Votkinsk", russian: "Воткинск"),
            Word(english: "Korolyov", russian: "Королёв"),
            Word(english: "Kiselyovsk", russian: "Киселёвск"),
            Word(english: "Novomoskovsk", russian: "Новомосковск"),
            Word(english: "Novocherkassk", russian: "Новочеркасск"),
            Word(english: "Salavat", russian: "Салават"),
            Word(english: "Armavir", russian: "Армавир"),
            Word(english: "Zelenograd", russian: "Зеленоград"),
            Word(english: "Balashikha", russian: "Балашиха"),
            Word(english: "Nevinnomyssk", russian: "Невинномысск"),
            Word(english: "Ussuriysk", russian: "Уссурийск"),
            Word(english: "Reutov", russian: "Реутов"),
            Word(english: "Kolomna", russian: "Коломна"),
            Word(english: "Norilsk", russian: "Норильск"),
            Word(english: "Zhukovsky", russian: "Жуковский"),
            Word(english: "Khasavyurt", russian: "Хасавюрт"),
            Word(english: "Noginsk", russian: "Ногинск"),
            Word(english: "Ukhta", russian: "Ухта"),
            Word(english: "Kovrov", russian: "Ковров"),
            Word(english: "Mytishchi", russian: "Мытищи"),
            Word(english: "Neftekamsk", russian: "Нефтекамск"),
            Word(english: "Sergiev Posad", russian: "Сергиев Посад"),
            Word(english: "Bataysk", russian: "Батайск"),
            Word(english: "Prokhladny", russian: "Прохладный"),
            Word(english: "Domodedovo", russian: "Домодедово"),
            Word(english: "Nazarovo", russian: "Назарово"),
            Word(english: "Kamensk-Shakhtinsky", russian: "Каменск-Шахтинский"),
            Word(english: "Belogorsk", russian: "Белогорск"),
            Word(english: "Omsk", russian: "Омск"),
            Word(english: "Balakovo", russian: "Балаково"),
            Word(english: "Ishim", russian: "Ишим"),
            Word(english: "Tuapse", russian: "Туапсе"),
            Word(english: "Serpukhov", russian: "Серпухов"),
            Word(english: "Stary Oskol", russian: "Старый Оскол"),
            Word(english: "Zheleznogorsk", russian: "Железногорск"),
            Word(english: "Novouralsk", russian: "Новоуральск"),
            Word(english: "Votkinsk", russian: "Воткинск"),
            Word(english: "Krasnokamensk", russian: "Краснокаменск"),
            Word(english: "Veliky Novgorod", russian: "Великий Новгород"),
            Word(english: "Chapayevsk", russian: "Чапаевск"),
            Word(english: "Syzran", russian: "Сызрань"),
            Word(english: "Ozyorsk", russian: "Озёрск"),
            Word(english: "Gelendzhik", russian: "Геленджик"),
            Word(english: "Yuzhno-Sakhalinsk", russian: "Южно-Сахалинск"),
            Word(english: "Volgodonsk", russian: "Волгодонск"),
            Word(english: "Balashov", russian: "Балашов"),
            Word(english: "Shchyokino", russian: "Щёкино"),
            Word(english: "Yasny", russian: "Ясный"),
            Word(english: "Beloretsk", russian: "Белорецк"),
            Word(english: "Verkhnyaya Pyshma", russian: "Верхняя Пышма"),
            Word(english: "Pushkino", russian: "Пушкино"),
            Word(english: "Novoshakhtinsk", russian: "Новошахтинск"),
            Word(english: "Maykop", russian: "Майкоп"),
            Word(english: "Ivanovo", russian: "Иваново"),
            Word(english: "Sarov", russian: "Саров")
        ]
    }
}
