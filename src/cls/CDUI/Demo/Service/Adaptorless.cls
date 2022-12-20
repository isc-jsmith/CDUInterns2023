Class CDUI.Demo.Service.Adaptorless Extends Ens.BusinessService
{

/// Override this method to process incoming data. Do not call SendRequestSync/Async() from outside this method (e.g. in a SOAP Service or a CSP page).
Method OnProcessInput(
	pInput As CDUI.Request.Hospital,
	Output pOutput As %RegisteredObject,
	ByRef pHint As %String) As %Status
{
	set sc = ..SendRequestSync("RoutingRule",.pInput,.pOutput)
	quit sc
}

}