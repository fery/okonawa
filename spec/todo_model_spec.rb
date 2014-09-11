describe Todo do 

  before do
    @todo = Todo.new
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
end