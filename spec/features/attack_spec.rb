feature 'Attack another player' do
  scenario 'Player 1 attacks player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Player 1 attacked Player 2'
  end

  scenario 'attacking player 2 reduce his HP' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(10)
    click_link 'Attack'
    expect(page).to have_content 'Player 2: 90HP'
  end
end