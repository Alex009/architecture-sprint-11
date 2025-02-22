workspace "Будущее 2.0" "Диаграммы контекста и контейнеров" {
    !identifiers hierarchical

    model {
        dwh = softwareSystem "Data Warehouse" {
            db = container "DataBase" "SQL Server 2008"
            client = container "Клиентский интерфейс оператора" "Power Builder"

            powerBi = container "BI система" "Power BI"

            integra = container "Интеграционная шина" "Apache Camel"

            client -> db "вызов операций"
            db -> client "получение данных"

            db -> powerBi "Получение данных"

            integra -> db "Запись данных"
            db -> integra "Получение данных"
        }

        fintech = softwareSystem "Финтех сервисы" "Go / Java"
        ml = softwareSystem "ML сервисы" "Python"
        internal = softwareSystem "Внутренние сервисы"

        fintech -> dwh.integra "Передача данных"
        ml -> dwh.integra "Передача данных"
        internal -> dwh.integra "Передача данных"
    }

    views {
        theme default

        systemLandscape {
            include *
            autoLayout tb
        }

        container dwh {
            include *
            autoLayout tb
        }
    }
}