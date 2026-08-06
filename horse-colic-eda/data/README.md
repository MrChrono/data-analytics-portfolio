# Data

| Файл | Роль |
|---|---|
| `horse_data.csv` | Исходная обучающая часть UCI Horse Colic: 300 строк × 28 полей. |
| `horse_data.names.txt` | Исходное описание полей и кодов. |
| `horse_data_imputed.csv` | Производный набор: 300 строк × 8 выбранных признаков, без пропусков. |

## Provenance

McLeish, M. & Cecile, M. (1989). *Horse Colic* [Dataset]. UCI Machine Learning Repository. [https://doi.org/10.24432/C58W23](https://doi.org/10.24432/C58W23).

License: [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).

## Processing note

`horse_data_imputed.csv` создаётся последней ячейкой `horse_colic_eda_portfolio.ipynb`. Исходный файл не изменяется; заполнение выполняется только в копии данных. Для категориальных групп используется мода только при единственном наиболее частом значении, а при ничьей применяется описанное в notebook резервное правило.
