XPTemplate priority=lang-1
XPTinclude
      \ _common/common

XPT mprop
createTime column:'C_CREATETIME';
XPT mapping
	static mapping={
		table 'H_RETAILSALEORDER';
		version false;
		autoTimestamp false;
		id column : 'C_ID';
		name column : 'C_NAME';
		state column:'C_STATE';
		createTime column:'C_CREATE_TIME';
		updateTime column:'C_UPDATE_TIME';
	}
XPT one2many
	static hasMany=[items:SaleOrderItem];
XPT many2one
		static belongsTo=SaleOrder;
XPT component
	static embedded = ['operator'];
XPT uuid
	id  column:"C_UUID",generator: 'uuid'
XPT entity
	String name;
	String number;
	int state;
	Date createTime;
	Date updateTime;

XPT field
//field
['name':'name',
'label':'label',
'type':'String',
'columnName':'',
'ctrl':'check|text|select|option|date|email|currency|number'],
`cursor^
XPT config
def config=[
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
