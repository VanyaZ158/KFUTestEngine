json.meta do
  json.next_page path_to_next_page @users
  json.prev_page path_to_prev_page @users
end
json.data do
  json.users @users, partial: 'shared/user', as: :user
end
