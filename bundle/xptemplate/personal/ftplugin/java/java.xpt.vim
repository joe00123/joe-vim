XPTemplate priority=lang-1
XPTinclude
      \ _common/common

XPT sout
System.out.println("`cursor^")

XPT fori
for(int i=0;i<0;i++){
	`cursor^
}
Vdef config=[
	"modelName":"User",
	"packageName":"com.joytime.eticket",
	"templatePath":"/",
"fields":[
//field
['name':'name',
'label':'label',
'type':'String',
'ctrl':'check|text|select|option|date|email|currency|number'],
`cursor^
],
];
