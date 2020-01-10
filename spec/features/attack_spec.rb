# frozen_string_literal: true

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

feature 'Can try a paralyze attack' do
  scenario 'Player 1 is not able to paralyze the enemy' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(2)
    click_link 'Paralyze'
    expect(page).to have_content 'Player 1 tried to'
  end

  scenario 'Player 1 is able to paralyze the enemy' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(1)
    click_link 'Paralyze'
    expect(page).to have_content 'Player 1 paralyzed'
    expect(page).to have_content "Player 1's turn"
  end

  scenario 'Player 2 is able to paralyze the enemy' do
    sign_in_and_play
    click_link 'Attack'
    allow(Kernel).to receive(:rand).and_return(1)
    click_link 'Paralyze'
    expect(page).to have_content 'Player 2 paralyzed'
    expect(page).to have_content "Player 2's turn"
  end
end
