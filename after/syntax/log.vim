setl conceallevel=2
setl concealcursor=nvic

syn match logDateEn /\v(Mon|Tue|Wed|Thu|Fri|Sat|Sun)\ \d{1,2}\ (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\ \d{2,4}/
syn match logDateRu /\v(Пн|Вт|Ср|Чт|Пт|Сб|Вс)\ \d{1,2}\ (янв|фев|мар|апр|май|июн|июл|авг|сен|окт|ноя|дек)\ \d{2,4}/

if bufname() =~ 'diffview.log$'
  syn match logPath /\v\S*\/\S*\/diffview.nvim\/lua\/diffview\// conceal
endif

hi def link logDateEn String
hi def link logDateRu String
