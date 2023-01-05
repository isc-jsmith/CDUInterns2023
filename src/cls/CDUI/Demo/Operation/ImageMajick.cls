Class CDUI.Demo.Operation.ImageMajick Extends Ens.BusinessOperation
{

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.StreamContainer">
    <Method>ConvertImage</Method>
  </MapItem>
</MapItems>
}

/// The type of adapter used to communicate with external systems
Parameter ADAPTER = "CDUI.PEX.ImageMajickOutboundAdaptor";

Parameter SETTINGS = "TargetFormat,ReplyCodeActions,RetryInterval,AlertRetryGracePeriod:Alerting,FailureTimeout,QueueCountAlert:Alerting,QueueWaitAlert:Alerting,SendSuperSession";

Property TargetFormat As %String;

Method ConvertImage(
	Request As Ens.StreamContainer,
	Response As CDUI.Demo.Response.ImageMajick) As %Status
{
	#dim sc as %Status = $$$OK
	new %objlasterror
	set sourcefile = Request.OriginalFilename
	
	set targetfile = ..Adapter."convert_format"(sourcefile,..TargetFormat)
	$$$LOGINFO("Target file : "_targetfile)
	set targetstream = ##class(%Stream.FileBinary).%New()
	set sc = targetstream.LinkToFile(targetfile)
	set sc = $$$ADDSC(sc,targetstream.%Save())
	set imgstream = ##class(%Stream.GlobalBinary).%New()
	set sc = imgstream.CopyFromAndSave(targetstream)
	set Response = ##class(CDUI.Demo.Response.ImageMajick).%New()
	set Response.Filename = targetfile
	set Response.ImageStream = imgstream
	set sc = $$$ADDSC(sc,Response.%Save())
	quit sc
}

}
