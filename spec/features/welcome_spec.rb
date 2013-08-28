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
      click_button('Click Me!');
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

describe 'A page called Quizzes', :js => true do

  before(:each) do
    visit '/quizzes'
  end

  it "has an input field and submit button" do
    button = page.find('button')
    label = 'calc'
    expect(page).to have_selector('input')
    expect(button.has_content?(label)).to be true
    expect(page).to have_no_selector('form')
  end

  it "can put stuff into field and click button" do
    input = page.find('#input')
    fill_in('input', :with => '1,2,3')
    expect(find_field('input').value).to eq('1,2,3')
  end

  it "can change color to green" do
    input = page.find('#input')
    fill_in('input', :with => '1,2,3')
    click_button('calc')
    expect(page).to have_css('body.green')
  end

  it "can change color to red" do
    input = page.find('#input')
    fill_in('input', :with => '1,4,3')
    click_button('calc')
    expect(page).to have_css('body.red')
  end

end

# MORE?!

# There should be a link on the home page called "quizzes"
# CHECK
# When a user clicks on "quizzes" they should be re-directed to "/quizzes"
# CHECK
# "/quizzes" should have an input field and a button labeled 'calc'
# CHECK
# "/quizzes" should not have a form tag
# CHECK
# We should be able to fill in a series of numbers separated by commas into the input field and click "calc"
# CHECK
# The numbers entered should be evaluated by a javascript function called check_increasing
# CHECK
# If the numbers entered are sorted and ascending the body's background should turn green
# else the body's background should turn be red
# CHECK