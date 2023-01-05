Class CDUI.Demo.PEXProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="CDUI.Demo.PEXProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.File.PassthroughService" Category="" ClassName="EnsLib.File.PassthroughService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/cduinterns/images/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.jpg</Setting>
  </Item>
  <Item Name="CDUI.Demo.Operation.ImageMajick" Category="" ClassName="CDUI.Demo.Operation.ImageMajick" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetFormat">png</Setting>
  </Item>
</Production>
}

}
