require 'spec_helper'

describe DBC do
  describe '.request' do
    context 'with an api token' do

      before do
        ENV.stub(:[]).with('DBC_API').and_return('test123')
      end

      it 'should make an api request' do
        expect(RestClient).to_receive(:get)
      end
    end

    context 'without an api token' do
    end
  end
end
