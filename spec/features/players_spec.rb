feature 'Testing player actions with Capybara' do
  scenario 'Can fill in their names' do
    sign_in_and_play
    expect(page).to have_content("Player 1 Vs Player 2")
  end
end
