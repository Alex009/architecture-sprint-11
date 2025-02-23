# Практическая работа спринт 11

## Бизнес задачи

> 1. Сделать удобную «витрину данных». Это портал самообслуживания, который легко масштабировать вне зависимости от количества бизнесов и их бизнес-целей. По задумке, сотрудник может получить здесь отчёт по любым срезам, которые выберет, если это позволяет его уровень доступа. Ещё нужно добавить возможность конструировать отчёты самостоятельно. Обратите внимание: в витрину данных не нужно добавлять медицинские карты, истории болезней и результаты медицинских исследований. Эти данные компания не будет использовать для аналитики.
> 2. Предоставить архитектурное решение по изменению IТ-ландшафта в области работы с данными. Оно должно предусматривать интеграцию новых бизнесов без дописывания огромного количества бизнес-логики в DWH.

## Цели бизнеса
> - Промежуточное состояние (через пару месяцев). Сформировано архитектурное решение по трансформации. Уточнены границы доменов и связи между ними. Запланированы конкретные проекты в доменах по развитию «витрины данных».
> - Финальное состояние (через год). Реализован портал самообслуживания. Бизнес-пользователи в доменах могут использовать данные в рамках новой архитектуры. На этом этапе можно на некоторое время сохранить легаси-системы в отдельных доменах.

## Задание 1 - Целевая архитектура через год

Задание:
> 1. Спроектируйте архитектуру системы через год. Составьте диаграмму контейнеров в модели C4.
> 2. Опишите проблемные места. Сделайте это в удобной для вас форме. Например, можете использовать список или таблицу. Постарайтесь формулировать описания так, чтобы они были понятны не только инженерам, но и бизнесу.
> 3. Приоритизируйте выявленные проблемы. Для этого вы можете использовать методы, которые изучили на курсе. Например, MoSCoW или матрицу Эйзенхауэра.

Ожидания:
> В директории Exc1 должна лежать диаграмма контейнеров, а также анализ проблемных мест с их приоритизацией.

Решение:
1. Анализ проблем и приоритезацию и предлагаемое решение для развития можно прочитать в файле [Analyze](Exc1/ANALYZE.md)
2. Диаграмма контейнеров C4:
    - Можно запустить в structurizer - [скрипт](Exc1/run-structurizr.sh), а потом открыть http://localhost:8080 
    - Либо посмотреть [картинкой](Exc1/c4-container.png)

## Задание 2 - Разделение на домены

Задание:
> 1. Разделите систему на домены, чтобы их можно было независимо развивать без необходимости реализовать новую логику в DWH.
> 2. Отразите потоки данных между доменами. Для этого отрисуйте Data Flow Diagram. Отразите на ней запланированные изменения в архитектуре.
> 3. Аргументируйте логику разделения на домены. Опишите преимущества, которые получит компания, если разделит систему на домены так, как вы предлагаете.

Ожидания:
> В директории Exc2 должны лежать DFD и обоснование разделения архитектуры на домены.

Решение:
1. Аргументация по разделению на домены и сами домены предоставлены в [документе](Exc2/DOMAINS.md).
2. Диаграмма потоков данных в [drawio файле](Exc2/data-flow-diagram.drawio)

## Задание 3 - План реализации целевой архитектуры

Задание:
> 1. Сформируйте технический радар. Отразите на нём текущие технологии и методологии, а также предлагаемые изменения и технологии, которые сопутствуют основному стеку. Оформите радар в виде таблицы или круговой диаграммы.
> 2. Составьте роадмап. Отразите здесь изменения в технологическом ландшафте компании. Радар должен содержать этапы, их результаты, ответственные команды и ресурсы, которые потребуются. Оформите роадмап в draw.io или в другом инструменте на свой выбор.
> 3. Обоснуйте изменения. Опишите, зачем нужен каждый из этапов, которые вы включили в роадмап. Можете сделать это в том же файле, что и сам артефакт.

Ожидания:
> В директории Exc3  должны быть техрадар, роадмап и обоснование для каждого этапа изменений.

Решение:
1. Техрадар в виде [таблицы](Exc3/tech-radar.csv), [круговой диаграммы](Exc3/tech-radar-thoughtworks.png) и [описание к круговой диаграмме](Exc3/tech-radar-thoughtworks-legend.pdf).
