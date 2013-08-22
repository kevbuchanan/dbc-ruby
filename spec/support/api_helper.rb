module DBC
	module ApiHelper
		shared_examples_for 'an api request' do
			let (:token) {"adsfaf"}
			it 'should call DBC.request' do
				DBC.should_receive(:request)
			end
		end
	end
end
