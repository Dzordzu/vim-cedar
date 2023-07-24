" Vim syntax file
" Language:	Cedar
" Maintainer:	Tomasz Durda <tomekdur@wp.pl>
"

syntax case match

syn region cedarString start=/"/ end=/"/ containedin=ALLBUT keepend

" Effect
syn keyword cedarEffectKeyword permit forbid
syn keyword cedarOperator in has containsAll containsAny isIpv4 isIpv6 isLoopback isMulticast isInRange lessThan lessThanOrEqual greaterThan greaterThanOrEqual ip like decimal contains

" Scope
syn match cedarScopeKeywordsMatch /\(principal\|action\|resource\)/ contained
syn region cedarEffectBlock start=/(/ end=/)/ fold transparent contains=cedarScopeKeywordsMatch,cedarOperator,cedarTemplateKeywordsMatch

" Conditions
syn match cedarCondKeywordMatch /\(unless\|when\)/
syn match cedarCondKeywordsMatch /\(principal\|action\|resource\|context\)/ contained
syn region cedarCondBlock start=/{/ end=/}/ fold transparent contains=cedarCondKeywordsMatch,cedarOperator,cedarTemplateKeywordsMatch

syn match cedarTemplateKeywordsMatch /\(?principal\|?resource\)/

" Comments
syn region cedarComment start=/\/\// end= /$/ oneline

hi link cedarEffectKeyword Special
hi link cedarScopeKeywordsMatch PreProc
hi link cedarComment Comment
hi link cedarCondKeywordMatch Conditional
hi link cedarOperator Label

hi link cedarCondKeywordsMatch PreProc

hi link cedarString String
hi link cedarTemplateKeywordsMatch Identifier
