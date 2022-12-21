/// 
Class CDUI.Demo.Process.MsgRouter.RoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="CDUI.NewProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="CreateHospital">
<constraint name="source" value="CDUI.Service.Adaptorless"></constraint>
<constraint name="msgClass" value="CDUI.Request.Hospital"></constraint>
<when condition="1">
<send transform="CDUI.Transform.HospitalDTL" target="CDUI.ws.Operation.TChmfServiceTrakInboundSYSAPISoap"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
