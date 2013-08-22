require 'spec_helper'

describe DBC do
  describe '.request' do
    context 'with an api token' do
      before do
        ENV.stub(:[]).with('DBC_API').and_return('test123')
      end

      it 'should make an api request' do
        stub_request(:get, DBC.endpoint).to_return(body: JSON.generate({test: 'test'}))
        expect{ DBC.request('') }.to_not raise_error
      end
    end

    context 'without an api token' do
      it 'should throw an argument error' do
        expect{ DBC.request() }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.request_with_shared_token' do
    context 'with a shared token' do
      before do
        ENV.stub(:[]).with('DBC_SHARED').and_return('test123')
      end

      it 'should make an api request' do
        stub_request(:get, DBC.endpoint).to_return(body: JSON.generate({test: 'test'}))
        expect{ DBC.request_with_shared_token('') }.to_not raise_error
      end
    end

    context 'without a shared token' do
      it 'should throw an argument error' do
        expect{ DBC.request_with_shared_token() }.to raise_error(ArgumentError)
      end
    end
  end
end
