require 'rails_helper'

feature 'Admin registra categoria' do
  scenario 'com sucesso' do
    admin = create(:user, email: 'admin@email.com',
                          password: '123456', role: :admin)

    login_as admin, scope: :user
    visit new_category_path
    fill_in 'Nome', with: 'Festa'
    click_on 'Salvar'

    expect(current_path).to eq category_path(1)
    expect(page).to have_content('Festa')
  end
end
