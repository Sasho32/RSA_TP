require 'prime'

class RSA
	def initialize n, e, d
		@n = n 
		@e = e 
		@d = d
	end

	def n
		return @n
	end

	def e
		return @e	
	end

	def d
		return @d
	end

	def new_key
		p = Random.new.rand(1..100)
		q = Random.new.rand(1..100)
		identificator = 1
		unless identificator != 0
 			p = rand(1..100)
			q = rand(1..100)
			if Prime.prime?(p) && Prime.prime?(q)
				identificator = 0	
			end
		end		

		n = p * q
		res = (p-1).lcm(q-1)
		e = 3
		while res.gcd(e) != 1
		e += 1
		end
		d = 1
		identificator = 1
		unless identificator != 0
 			if (d * e) %  res == 1
				identificator = 0				
			else 
				d += 1
			end
		end			

		[n, e, d]
	end

	def encrypt message
		return (message.chars.map {|c| c.ord ** @e % @n }).join("::")
	end

	def decrypt message
	 	return (message.split("::").map {|c| (c.to_i ** @d % @n ).chr}).join("")
	end 
end
