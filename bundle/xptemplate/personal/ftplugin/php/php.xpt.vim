XPTemplate priority=lang-1
XPTinclude
      \ _common/common

XPT impMapping
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column,Float,Date,DateTime, Integer,BigInteger, String,ForeignKey
from sqlalchemy.orm import relationship, backref

XPT keybint
`varName^= Column('`varName^',BigInteger, primary_key=True)
XPT keyint
`varName^= Column('`varName^',Integer, primary_key=True)


XPT keystr
`varName^= Column('`varName^',String(`len^), primary_key=True)


XPT clbint
`varName^ = Column('`varName^',BigInteger,default=0)
XPT clint
`varName^ = Column('`varName^',Integer,default=0)
XPT clfloat
`varName^ = Column('`varName^',Float,default=0)
XPT clstr
`varName^ = Column('`varName^',String(`len^),nullable=True)
XPT cldate
`varName^ = Column('`varName^',Date,nullable=True)
XPT cldatetime
`varName^ = Column('`varName^',DateTime,nullable=True)

XPT many2one
`parent^ = relationship("`parentCls^",backref="`children^",remote_side='`parentCls^.id')
`parent^_id=Column(BigInteger,ForeignKey('`parentTable^.id'))


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


XPT resouce-import
from flask_restful import Resource, Api
from flask.ext.responses import json_response, xml_response, auto_response
api = Api(app)

XPT resouce
class `User^(Resource):
    def get(self,id):
        return {}
    def post(self,id):
        print("mm")
        from flask_restful import reqparse
        from flask import request
        parser = reqparse.RequestParser()
        parser.add_argument('name')
        parser.add_argument('addresses',action='append')
        args = parser.parse_args()
        print(args['addresses']);
        print(request.json['addresses']);
        return {'abc':'abc'}
    def delete(self,id):
        return {}
api.add_resource(`User^, '/`user^/<string:id>')


XPT mitem_strstr
"`key^":"`v^", 

XPT mitem1_strstr
m["`key^"]="`v^" 

XPT mitem_strint
"`key^":`v^, 

XPT mitem1_strint
m["`key^"]=`v^ 

XPT breakpoint
_ = "breakpoint"

XPT foreach
for _,`v^ := range `list^{
	`cursor^
}

XPT embedded
	`Item^      `EmbEntity^ \`gorm:"embedded;embedded_prefix:`item_^"\`

XPT hasmany
	`Items^ []`InOutStoreItem^ \`gorm:"save_associations:true;ForeignKey:OrderID;AssociationForeignKey:ID"\`
XPT hasone
`Account^ `Account^ \`gorm:"save_associations:false"\` //账户信息



XPT classentity
type `EntityName^ struct {
	Entity
	EntityOpt
}


XPT classorder
// `InOutStore^
type `InOutStore^ struct {
	BaseOrder
	Items []`InOutStore^Item \`gorm:"save_associations:true;ForeignKey:OrderID;AssociationForeignKey:ID"\`
}

// `InOutStore^Item 出入库单明细
type `InOutStore^Item struct {
	BaseOrderItem
	Order *`InOutStore^
}

XPT new
`var^:=new(`type^)

XPT sout
fmt.PrintLn()

XPT soutf
fmt.Printf()

XPT makechan
`c^ :=make(chan `type^)

XPT makechanb
`c^ :=make(chan `type^, `count^)

XPT makemap_stringinterface 
`m^ := make(map[string]interface{})

XPT tointerface
var `var^ `type^
`var^ = `this^

XPT iferror
if err := `exp^; err != nil {
		log.Println(err)
		return err
}
XPT rpcservicecreate
func Create`ProductService^() interface{} {
	log.Println("初始化`ProductService^服务")
	result := new(`ProductService^)
	result.child = result
	return result
}

XPT rpcservice
type `Warehouse^Service struct {
	BaseService
}
func (t *`Warehouse^Service) Create(r *http.Request, entity *models.`Warehouse^, result *interface{}) error {
	*result=entity
	return t.GetDb(r).Create(entity)
}

func (t *`Warehouse^Service) Update(r *http.Request, entity *models.`Warehouse^, result *interface{}) error {
	return t.GetDb(r).Update(entity)
}

func (t *`Warehouse^Service) Delete(r *http.Request, entity *models.``Warehouse^, result *interface{}) error {
	return t.GetDb(r).Delete(entity)
}

XPT linqsum
From(`a.Items^).Select(func(item interface{}) interface{} {
	return item.(`AccountStorage^).`Amount^
}).SumFloats()
