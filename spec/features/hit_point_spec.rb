feature 'View hit points' do
    scenario 'see player 2 hit points' do
        visit '/'
        fill_in :name1, with: 'Gigi'
        fill_in :name2, with: 'Umberto'
        click_button 'Submit'
        expect(page).to have_content 'Umberto: 100HP'
    end
end