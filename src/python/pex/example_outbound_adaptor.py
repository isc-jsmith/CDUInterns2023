# Simple Python PEX outbound adaptor.
# Requires ImageMagick libraries for Python.
# "convert_format" method takes an input filename and target format
# Returns a converted file path.
import iris
import pathlib
from iris import pex
from wand.image import Image

class ImageMajickOutboundAdaptor(iris.pex.OutboundAdapter):

	def convert_format(self, filename,targetformat='png'):
		img = Image(filename=filename)
		source_path = pathlib.Path(filename)
		suffix = '.' + targetformat
		target_path = str(source_path.with_suffix(suffix))
		with img.convert(str(targetformat)) as converted:
			converted.save(filename=target_path)
		return target_path
