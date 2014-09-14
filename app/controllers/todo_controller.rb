class TodoController < Formotion::FormController
  attr_accessor :form
  attr_accessor :todo

  def initialize(todo)
    self.form = Formotion::Form.new(todo.to_formotion('Edit ToDo'))
    self.initWithForm(self.form)
    self.todo = todo
  end  

  def viewDidLoad
    super

    saveButton =  UIBarButtonItem.alloc.initWithTitle("Save", 
                    style: UIBarButtonItemStyleBordered, 
                    target: self, action: 'save') 

    self.navigationItem.rightBarButtonItem = saveButton

  end

  def save
    data = self.form.render
    self.todo.from_formotion!(data)
    self.todo.save
  end
end