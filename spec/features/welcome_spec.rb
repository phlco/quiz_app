require 'spec_helper'
#  _______  _______  _______  __   __  _     _  __   __  _______  ______
# |       ||   _   ||       ||  | |  || | _ | ||  | |  ||   _   ||      |
# |       ||  |_|  ||    _  ||  |_|  || || || ||  |_|  ||  |_|  ||___   |
# |       ||       ||   |_| ||       ||       ||       ||       |  __|  |
# |      _||       ||    ___||_     _||       ||       ||       | |_____|
# |     |_ |   _   ||   |      |   |  |   _   ||   _   ||   _   |   __
# |_______||__| |__||___|      |___|  |__| |__||__| |__||__| |__|  |__|
# http://jnicklas.github.io/capybara/
# (\~---.
#  /   (\-`-/)
# (      ' ' )
#  \ (  \_Y_/\
#   ""\ \___//
#      `w   "
describe "The Home Page" do

  before(:each) do
    visit '/'
  end

  it "says 'hello and welcome'" do
    expect(page).to have_content("hello and welcome")
  end

  it "has the title 'Week 1011'" do
    expect(page).to have_title "Week 1011"
  end

  it "has a link to /javascript" do
    find_link('JavaScript').click
    expect(page).to have_content('Comp-Sci')
    expect(current_path).to eq('/javascript')
  end

  it "has a link to /quizzes" do
    find_link('Quizzes').click
    expect(current_path).to eq('/quizzes')
  end

end

describe 'A page called JavaScript' do

  before(:each) do
    visit '/javascript'
  end

  it "Has an h1 with the text 'Comp-Sci'" do
    h1 = page.find('h1')
    text = 'Comp-Sci'
    expect(h1.has_content?(text)).to be true
  end

  it "has a button labeled 'Click Me!'" do
    button = page.find('button')
    label = 'Click Me!'
    expect(button.has_content?(label)).to be true
  end

  describe "clicking the button with JavaScript enabled", :js => true do

    before(:each) do
      click_button('Click Me!')
    end

    it "changes the h1's text to Comp-Sigh using jQuery" do
      expect(page).to have_content('Comp-Sigh')
      expect(page).to have_no_content('Comp-Sci')
    end

    it "changes the body's background to pink", :js => true do
      expect(page).to have_css('body.pink')
    end

    it "disables the button", :js => true do
      button = page.find('button')
      expect(button.disabled?).to be true
    end

  end

end

describe 'A page called Quizzes' do

  before (:each) do
    visit '/quizzes'
  end

  it "has a field called calc" do
    expect(page).to have_field('calc')
  end

  it "has an input button called Submit" do
    expect(page).to have_selector('input[type=submit]')
  end

  it "has no form tag" do
    expect(page).to have_no_selector('form')
  end

  describe 'clicking the button calc with JavaScript enable', :js => true do

    it "changes the background color to green if numbers entered are sorted and ascending" do
      fill_in 'calc', :with => '1,4,6'
      click_button('Calc')
      expect(page).to have_css('body.green')
    end

    it "changes the background color to red if numbers are not sorted and ascending" do
      fill_in 'calc', :with => '9,1,4'
      click_button('Calc')
      expect(page).to have_css('body.red')
    end
  end

end




# MORE?!

### There should be a link on the home page called "quizzes"
### When a user clicks on "quizzes" they should be re-directed to "/quizzes"
### "/quizzes" should have an input field and a button labeled 'calc'
### "/quizzes" should not have a form tag
# We should be able to fill in a series of numbers separated by commas into the input field and click "calc"
# The numbers entered should be evaluated by a javascript function called check_increasing
# If the numbers entered are sorted and ascending the body's background should turn green
# else the body's background should turn be red