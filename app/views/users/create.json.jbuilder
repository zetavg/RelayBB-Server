json.partial! 'users/user', locals: {
  user: @user
}

json.errors @user.errors
