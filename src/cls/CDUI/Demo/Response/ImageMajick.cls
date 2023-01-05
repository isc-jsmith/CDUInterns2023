Class CDUI.Demo.Response.ImageMajick Extends Ens.Response
{

Property ImageStream As %Stream.Object;

Property Filename As %String;

Storage Default
{
<Data name="ImageMajickDefaultData">
<Subscript>"ImageMajick"</Subscript>
<Value name="1">
<Value>ImageStream</Value>
</Value>
<Value name="2">
<Value>Filename</Value>
</Value>
</Data>
<DefaultData>ImageMajickDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
