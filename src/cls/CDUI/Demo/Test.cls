Class CDUI.Demo.Test
{

ClassMethod Send(Active As %String = "Y") As %Status
{
	set request = ##class(CDUI.Demo.Request.Location).%New()
	set request.Active = Active
	#; ,request.HospitalDesc = Desc
	set sc = ##class(Ens.Director).CreateBusinessService("CDUI.Demo.Service.Adaptorless",.svc)
	set sc = $$$ADDSC(sc,svc.ProcessInput(request,.response))
	if $$$ISOK(sc)
	{
		set json = {}.%FromJSON(response.StringValue)
		set iterator = json.results.%GetIterator()
		while iterator.%GetNext(.key,.value)
		{
			write !,value.CTLOCCode,?30,value.CTLOCDesc
		}
	}
	quit sc
}

}
