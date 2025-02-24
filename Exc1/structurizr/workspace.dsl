workspace "Будущее 2.0" "Диаграммы контекста и контейнеров" {
    !identifiers hierarchical

    model {
        future20 = softwareSystem "Будущее 2.0" "Комплекс систем для медицинской и финансовой деятельности" {

            clinicalDb = container "Clinics DB" "MS SQL Server 2008" "Хранит оперативные данные клиник и содержит часть бизнес-логики (PowerBuilder)"
            powerBuilder = container "Clinics Interface" "Power Builder" "Интерфейс для операторов в клиниках"

            integration = container "Integration Layer" "Apache Camel"

            minio = container "Object Storage" "MinIO" "Хранение файлов"
            iceberg = container "Table storage" "Apache Iceberg" "Обеспечивает транзакционную работу с большими наборами данных в MinIO"
            dremio = container "SQL query engine" "Dremio" "Позволяет BI-системам и сервисам выполнять запросы к данным в Iceberg/MinIO."

            dataHub = container "Data Catalog" "DataHub" "Каталог и управление метаданными, lineage, описания наборов данных."

            powerBi = container "BI System" "Power BI" "Инструмент самообслуживания и построения отчётов."

            powerBuilder -> clinicalDb "CRUD-операции и бизнес-логика для клиник"
            clinicalDb -> powerBuilder "Результаты операций"

            clinicalDb -> integration "Передача изменений/данных из клиник"
            integration -> clinicalDb "Получение / Актуализация справочной информации (если нужно)"

            integration -> iceberg "Регистрация/обновление таблиц"

            dremio -> iceberg "SQL-запросы к транзакционной прослойке"
            iceberg -> minio "Фактическое хранение данных"

            powerBi -> dremio "Запросы для BI-отчётов"
            dataHub -> dremio "Сканирование схем/таблиц для метаданных"
            dataHub -> iceberg "Сканирование метаданных для описания структур"
            
            dataHub -> integration "lineage по ETL-процессам"
        }

        fintech = softwareSystem "Финтех сервисы" "Go / Java"
        mlServices = softwareSystem "ML сервисы" "Python"
        pharmaServices = softwareSystem "Фармацевтические сервисы"
        medEquipmentServices = softwareSystem "Сервисы медицинского оборудования"

        fintech -> future20.integration "Передача данных для аналитики"
        mlServices -> future20.integration "Передача данных для аналитики"
        pharmaServices -> future20.integration "Передача данных для аналитики"
        medEquipmentServices -> future20.integration "Передача данных для аналитики"

        mlServices -> future20.dremio "Чтение датасетов (анонимизированные, аггрегированные)"
    }

    views {
        theme default

        systemLandscape {
            include *
            autoLayout tb
        }

        container future20 {
            include *
            autoLayout tb
        }
    }
}