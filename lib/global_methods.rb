module GlobalMethods
	module ClassMethods
		def rand_string length = 10
			a = ['a'..'z', '0'..'9']
			str = ''
			
			length.times do
				str << a[rand(36)]
			end
			return str
		end
	end
	
	module InstanceMethods
		
	end
	
	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end