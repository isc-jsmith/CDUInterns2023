Class CDUI.Demo.Request.ImageMajick Extends Ens.Request
{

Property ImageStream As Ens.StreamContainer;

Storage Default
{
<Data name="ImageMajickDefaultData">
<Subscript>"ImageMajick"</Subscript>
<Value name="1">
<Value>ImageStream</Value>
</Value>
</Data>
<DefaultData>ImageMajickDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
