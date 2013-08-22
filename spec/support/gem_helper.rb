module Gem
	module GemHelper
		shared_examples_for 'make a call to the API' do
			let (@token) {"adsfaf"}
			it 'should call DBC.request' do
				DBC.should_receive(:request)
			end
		end
	end
end
