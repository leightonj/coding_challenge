user = User.find_or_initialize_by(username: 'admin')
user.update(password: 'admin', usertoken: 'Rsxg7LyxKYwDxi5R6TQs')
