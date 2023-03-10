/// 
Class CDUI.Demo.Process.MsgRouter.RESTRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="CDUI.Demo.Production">
<ruleSet name="REST" effectiveBegin="" effectiveEnd="">
<rule name="Location">
<constraint name="source" value="CDUI.Demo.Service.Adaptorless"></constraint>
<when condition="1">
<send transform="" target="CDUI.Demo.Operation.REST.Location"></send>
<return></return>
</when>
</rule>
<rule name="" disabled="true">
<constraint name="source" value="CDUI.Demo.Service.Adaptorless"></constraint>
<constraint name="msgClass" value="CDUI.Demo.Request.NewLocation"></constraint>
<when condition="1">
<send transform="" target="CDUI.Demo.Operation.REST.Location"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
