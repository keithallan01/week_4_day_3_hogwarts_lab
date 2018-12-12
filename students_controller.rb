require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')
require('pry')

# index
get '/hogwarts-students' do
  @students = Student.all()
  # binding.pry
  erb( :index)
end

# new
get '/hogwarts-students/new' do
  erb( :new)
end

# show
get '/hogwarts-students/:id' do
  @student = Student.find(params[:id])
  erb( :show)
end



# create
post '/hogwarts-students' do
  @student = Student.new(params)
  @student.save
  erb( :create)
end


# edit
get '/hogwarts-students/:id/edit' do
  @student = Student.find( params[:id])
  erb( :edit)
end

# update
post '/hogwarts-students/:id' do
  Student.new( params ).update
  redirect to '/hogwarts-students'
end

# destroy
post '/hogwarts-students/:id/delete' do
  student = Student.find( params[:id] )
  student.delete()
  redirect to '/hogwarts-students'
end
