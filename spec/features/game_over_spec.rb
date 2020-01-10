# frozen_string_literal: true

feature 'shows winner' do
  scenario 'Player 1 wins' do
    sign_in_and_play
    allow(Kernel).to receive(:rand) { 110 }
    click_link 'Attack'
    expect(page).to have_content('Player 1 wins')
  end

  scenario 'Player 2 wins' do
    sign_in_and_play
    allow(Kernel).to receive(:rand) { 0 }
    click_link 'Attack'
    allow(Kernel).to receive(:rand) { 100 }
    click_link 'Attack'
    expect(page).to have_content('Player 2 wins')
  end
end
