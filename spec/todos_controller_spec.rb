describe 'Todos Controller ' do
  tests TodosController

  before do
    Todo.delete_all
    @now = NSDate.new

    @todo = Todo.create :name        => 'A name',
                        :description => 'A description',
                        :due_date    => @now

    @table = controller.tableView
  end

  it 'should exist' do 
    @table.should.not == nil
  end

  it 'should have visible cells' do 
    @table.visibleCells.should.not.be.empty
  end

  it 'should display Something as the first item to buy' do
    cell = @table.visibleCells.first
    cell.textLabel.text.should == 'A name'
  end
end