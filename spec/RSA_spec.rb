require '../lib/RSA.rb'

describe RSA do

	message = "I love TP!<3 (ne se maznya)"
	object = RSA.new(3233, 17, 413)
	array_of_keys = object.new_key
	puts array_of_keys
	second_object = RSA.new(array_of_keys[0], array_of_keys[1], array_of_keys[2])
	
	describe "#n" do
    	it "checks the 'n' function" do
        	expect(object.n).to eq(3233)
      	end
	end

	describe "#e" do
    	it "checks the 'e' function" do
        	expect(object.e).to eq(17)
      	end
	end

	describe "#d" do
    	it "checks the 'd' function" do
        	expect(object.d).to eq(413)
      	end
	end

	describe "#decrypt" do
    	it "checks if the decrypt method works properly by returning the original message" do
        	expect(second_object.decrypt(second_object.encrypt(message))).to eq(message)
      	end
		
		it "checks the decrypt method with message which is more likely to fail" do
			expect(second_object.decrypt(second_object.encrypt("!_E+@$)4$ssA)E!DC)_S(Z+X"))).to eq("!_E+@$)4$ssA)E!DC)_S(Z+X")
      	end
	end
end
