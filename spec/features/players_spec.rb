feature 'Testing player actions with Capybara' do
  scenario 'Can fill in their names' do
    visit('/')
    fill_in "name1", :with => "Player 1"
    fill_in "name2", :with => "Player 2"
    click_button "Submit"
    expect(page).to have_text("Player 1 versus Player 2")
  end
end
