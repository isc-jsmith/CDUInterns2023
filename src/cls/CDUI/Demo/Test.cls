Include %syPrompt

Class CDUI.Demo.Test
{

ClassMethod List(
	StartsWith As %String = "",
	PageSize As %Integer = "",
	ByRef Page As %Integer = "",
	ByRef Results) As %Status
{
	set request = ##class(CDUI.Demo.Request.Location).%New()
	set request.Description = StartsWith
	if Page'=""
	{
		set request.page = Page
	}
	if PageSize'=""
	{
		set request.count = PageSize
	}
	#; ,request.HospitalDesc = Desc
	set sc = ##class(Ens.Director).CreateBusinessService("CDUI.Demo.Service.Adaptorless",.svc)
	set sc = $$$ADDSC(sc,svc.ProcessInput(request,.response))
	if $$$ISOK(sc)
	{
		set json = {}.%FromJSON(response.StringValue)
		set iterator = json.results.%GetIterator()
		while iterator.%GetNext(.key,.value)
		{	
			set Results($i(Results)) = $listbuild(value.CTLOCCode,value.CTLOCDesc)
			#; write !,value.CTLOCCode,?30,value.CTLOCDesc
		}
		#; if json.links'="" 
		#; {
		#; 	zw json.links
		#; }
	}
	quit sc
}

ClassMethod ListLocations()
{
	set promptResult = ##class(%Prompt).GetString("Search for location starting with : ",.value)
	set sc = ..List(value,24,.page,.results)
	set i = ""
	for
	{
		set i = $order(results(i),1,location)
		quit:i=""
		set code = $listget(location),codelen = $l(code)
		write !,$listget(location,1)_$J("",(15-codelen))_" : "_$listget(location,2)
	}
}

ClassMethod NewLocation()
{
	set CTLOCCode = "Z"_##class(%PopulateUtils).String(5)
	set CTLOCDesc = $ZCVT($translate(##class(%PopulateUtils).Syllable(10)," "),"S")
	set request = ##class(CDUI.Demo.Request.NewLocation).%New()
	set request.CTLOCCode = CTLOCCode,request.CTLOCDesc = CTLOCDesc
	set sc = ##class(Ens.Director).CreateBusinessService("CDUI.Demo.Service.Adaptorless",.svc)
	set sc = $$$ADDSC(sc,svc.ProcessInput(request,.response))
	break
}

}
