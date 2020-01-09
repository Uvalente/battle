# frozen_string_literal: true

feature 'shows turn' do
  scenario 'Player 1 start' do
    sign_in_and_play
    expect(page).to have_content("Player 1's turn")
  end

  scenario 'After the first attack is player 2 turn' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content("Player 2's turn")
  end
end
