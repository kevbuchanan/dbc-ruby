require 'spec_helper'

describe DBC::DbcObject do
  describe '.all' do
    before do
      ENV.stub(:[]).with('DBC_API').and_return('test123')
      DBC.stub(:request).and_return({objects: [{attribute: 'test'}]})
    end

    it 'should make a request with the correct endpoint' do
      expect(DBC).to receive(:request).with('/', {})
      DBC::DbcObject.all()
    end

    it 'should return an array of objects' do
      objects = DBC::DbcObject.all()[:objects]
      expect(objects).to be_a(Array)
      expect(objects.first).to be_a(DBC::DbcObject)
    end
  end

  describe '.find' do
    before do
      ENV.stub(:[]).with('DBC_API').and_return('test123')
      DBC.stub(:request).and_return({object: {attribute: 'test'}})
    end

    it 'should make a request with the correct endpoint' do
      expect(DBC).to receive(:request).with('/1')
      DBC::DbcObject.find(1)
    end

    it 'should return one object' do
      expect(DBC::DbcObject.find(1)[:object]).to be_a(DBC::DbcObject)
    end
  end
end
