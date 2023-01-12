Class MSTeamsNotification.Token Extends %Persistent
{

/// <p>If a persistent class uses %Storage.Persistent then the <var>DEFAULTGLOBAL</var> parameter is used as the
/// default global root for the values of the storage keywords COUNTERLOCATION, DATALOCATION, IDLOCATION,
/// INDEXLOCATION and STREAMLOCATION in the active storage definition. <var>DEFAULTGLOBAL</var> is only used
/// to generate location keyword values that are not already defined. The location value is constructed by adding
/// a location type to the end of <var>DEFAULTGLOBAL</var>. For example, if <var>DEFAULTGLOBAL</var> = "^GL.Account"
/// the compiler will generate <var>DATALOCATION</var> = ^GL.AccountD.</p>
/// <p>
/// If <parameter>USEEXTENTSET</parameter> is true, then DEFAULTGLOBAL is used as the default extent location. 
/// </p>
/// <br>
/// The location types are:
/// <table>
/// <tr><th align="left">Location</th><th align="left">Type</th>
/// <tr><td>COUNTERLOCATION</td><td align="center">C</td></tr>
/// <tr><td>DATALOCATION</td><td align="center">D</td></tr>
/// <tr><td>IDLOCATION</td><td align="center">D</td></tr>
/// <tr><td>INDEXLOCATION</td><td align="center">I</td></tr>
/// <tr><td>STREAMLOCATION</td><td align="center">S</td></tr>
/// </table>
Parameter DEFAULTGLOBAL As STRING = "^TMP.Token";

Property Expires As %TimeStamp;

Property Token As %String;

Index ExpiryIndex On Expires;

Storage Default
{
<Data name="TokenDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Expires</Value>
</Value>
<Value name="3">
<Value>Token</Value>
</Value>
</Data>
<DataLocation>^TMP.TokenD</DataLocation>
<DefaultData>TokenDefaultData</DefaultData>
<IdLocation>^TMP.TokenD</IdLocation>
<IndexLocation>^TMP.TokenI</IndexLocation>
<StreamLocation>^TMP.TokenS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
