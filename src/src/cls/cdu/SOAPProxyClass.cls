Class cdu.SOAPProxyClass
{

Parameter DEFAULTURL = "http://auxxdev2022.iscinternal.com/csp/healthshare/auxx-config-hmfsys/services/TC.hmf.System.Service.Inbound.SYSAPI.cls?wsdl=1";

ClassMethod GenerateProxyClasses(
	Url As %String = "",
	Package As %String = "CDUI.ws") As %Status
{
	set Url = $select(Url'="":Url,1:..#DEFAULTURL)
	set request = ##class(%Net.HttpRequest).%New()
	set request.Username = "irisowner",
		request.Password = "SYS"
	set wsdl = ##class(%SOAP.WSDL.Reader).%New()
	set wsdl.HttpRequest = request
		,wsdl.MakeService = 1
		,wsdl.MakeEnsembleClasses = 1
		,wsdl.OperationPackage = Package_".Operation"
		,wsdl.ServicePackage = Package_".Service"
		,wsdl.RequestPackage = Package_".Request"
		,wsdl.ResponsePackage = Package_".Response"
	set sc = wsdl.Process(Url,Package)
	break
	#; set wsdl.%SOAP.WS
	quit sc
}

ClassMethod TestLocList(Location As %String = "")
{
	set ws = ##class(CDUI.ws.TChmfServiceTrakInboundSYSAPISoap).%New()
	#; set ws.Username = "irisowner",ws.Password = "SYS"
	set ws.Location = "http://auxxmiscprj.iscinternal.com:52773/csp/healthshare/auxxmisc-test-hmfsys/services/TC.hmf.System.Service.Inbound.SYSAPI.cls"
	set params = ##class(CDUI.ws.TC.api.CTLoc.FindList.Params).%New()
	set params.Active = "Y"
	set res = ws.CTLocFindListExecuteQuery("",params,"auadm","pass",0,"","")
#; 	Method CTLocFindListExecuteQuery(
#; 	token As %String,
#; 	params As CDUI.ws.TC.api.CTLoc.FindList.Params,
#; 	TUSERNAME As %String,
#; 	TPASSWORD As %String,
#; 	TENCRYPTPASSWORD As %Boolean,
#; 	TADDITIONALINFO As CDUI.ws.TC.hmf.Message.SYSAPI.AdditionalInfo,
#; 	TSESSIONID As %String) As %ListOfObjects(ELEMENTTYPE="CDUI.ws.TC.ws.CTLoc.FindList.DataSet",XMLITEMNAME="TC.ws.CTLoc.FindList.DataSet",XMLNAME="CTLocFindListExecuteQueryResult") [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
#; {
#;  Quit ..WebMethod("CTLocFindListExecuteQuery").Invoke($this,"http://www.intersystems.com/trak/ws/TC.hmf.System.Service.Inbound.SYSAPI.CTLocFindListExecuteQuery",.token,.params,.TUSERNAME,.TPASSWORD,.TENCRYPTPASSWORD,.TADDITIONALINFO,.TSESSIONID)
#; }
	break
	quit:$quit ""
}

}
