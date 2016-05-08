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


XPT mitem
u'`key^':u'`key^', 
