require 'spec_helper'

describe "todos/show" do
  before(:each) do
    @todo = assign(:todo, stub_model(Todo,
      :title => "Title",
      :body => "MyText",
      :done => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
