Rails.application.routes.draw do
  authenticated :user do

  end
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      password: 'forgot',
      confirmation: 'confirm',
      sign_up: 'sign_up',
      sign_out: 'signout'
    }

  authenticated :user do
    root to: 'dashboard#show', as: :user_root
  end
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  get 'dashboard/show'
end
