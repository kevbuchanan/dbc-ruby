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


# it "should auto populate feed after user.add_friend" do
#     FeedItem.should_receive(:populate_from_friend_to_user).with(@friend1, @user)
#     @user.add_friend(@friend1)
#  end