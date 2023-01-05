# Simple example of a PEX Business Operation using python
# See README.md for details.
import iris
from iris import pex
class ExampleOperation(iris.pex.BusinessOperation):

	def getAdapterType():
		return "EnsLib.File.OutboundAdapter"

	def OnMessage(self, request):
		import uuid
		file_name = str(uuid.uuid4()) + '.txt'
		self.LOGINFO(file_name)
		st = self.Adapter.invoke('PutString',file_name,request.get('StringValue'))
		self.LOGINFO(st)
		return "hello"
