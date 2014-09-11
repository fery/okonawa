describe ' Todos Controller ' do
  tests TodosController
  
  before do
    @table = controller.instance_variable_get('@table')
  end

  it 'should exist' do 
    @table.should.not == nil
  end

  it 'should have visible cells' do 
    @table.visibleCells.should.not.be.empty
  end

  it 'should display Something as the first item to buy' do
    cell = @table.visibleCells.first
    cell.textLabel.text.should == 'Buy Something'
  end
end