feature 'Adding sites' do
	scenario 'Able to add url to bookmark manager' do
		visit('/links/new')
		fill_in('url', with: 'http://www.makersacademy.com/')
		fill_in('title', with: 'Makers Academy')
		click_button 'Create Link'
		expect(current_path).to eq '/links'
		within 'ul#links' do
			expect(page).to have_content('Makers Academy')
		end
	end

end
