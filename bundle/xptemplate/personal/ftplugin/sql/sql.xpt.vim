XPTemplate priority=lang-1
XPTinclude
      \ _common/common

XPT sl "select * from 
select `cursor^ from `cursor^;

XPT sll "select left outer join 
select `cursor^ from `cursor^ left outer join on `cursor^=`cursor^;

XPT sha "show variables
show variables like '%%';

XPT shb "show binlog
show binlog events in 'eticket-lb.000011'

XPT flu "flush log
PURGE MASTER LOGS TO 'log_name';
flush logs;

XPT shml "show master logs
show master logs;

XPT shms "show master status
show master status;

XPT shss "show slave status
show slave status;

XPT shs "show state
show state;

XPT shp "show processlist
show processlist;

XPT grant "graint 
grant ALL PRIVILEGES on *.* to admin@'%' identified by 'admin';

XPT del "delete from 
delete from `cursor^;


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
