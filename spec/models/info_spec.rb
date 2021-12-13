require "rails_helper"

RSpec.describe Info, type: :model do

  current_user = User.first_or_create!(email: 'test@example.com', password: 'password', password_confirmation: 'password')
  
  it 'has a user' do
    info = Info.new(contents: 'a test contents')
    expect(info).to_not be_valid
    info.user_id = current_user.id
    expect(info).to be_valid
  end
  
  it 'has a contents' do 
    info = Info.new( user_id: current_user.id  )
    expect(info).to_not be_valid
    info.contents = 'a test contents'
    expect(info).to be_valid
  end

  it 'has a one like' do
    info = Info.create(contents: 'a test contents', user_id: current_user.id)
    like = info.likes.add(current_user)
    expect(like).to_not be_nil
    expect(info.like_by_user(current_user)).to be_truthy
    expect(info.like_count.like_count).to be > 0
  end
  
  it 'has a one comment' do
    info = Info.create(contents: 'a test contents', user_id: current_user.id)
    comment = Info::Comment.create( commentable_id: info.id,commentable_type: "Info" ,User_id: current_user.id, text_: "demo text")
    expect(comment).to_not be_nil
  end

end
