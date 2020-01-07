# frozen_string_literal: true

feature 'View hit points' do
  scenario 'see player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Player 2: 100HP'
  end
end
