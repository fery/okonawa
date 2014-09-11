describe Todo do 

  before do
    @now  = NSDate.new

    @todo = Todo.new :name        => 'Buy Milk',
                     :description => 'A description',
                     :due_date    => @now

  end

  it 'has a name, description a due data and wether is done or not' do
    @todo.should.respond_to :name
    @todo.should.respond_to :description
    @todo.should.respond_to :due_date
    @todo.should.respond_to :done
  end

  it 'is invalid without a name' do
    @todo.name = nil
    @todo.should.not.be.valid
  end

  it 'is invalid with a name' do
    @todo.should.be.valid
  end

  it 'should be overdue' do
    @todo.due_date = @now

    @todo.should.be.overdue
  end
end