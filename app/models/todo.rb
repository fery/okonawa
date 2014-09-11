class Todo
  include MotionModel::Model 
  include MotionModel::ArrayModelAdapter
  include MotionModel::Validatable

  columns :name     => :string,
          :details  => :string,
          :due_date => { :type => :date ,
                          :formotion => {:picker_type => :date_time}},
          :done     => { :type => :boolean , 
                         :formotion => {:type => :switch }}

  validates :name, :presence => true
end