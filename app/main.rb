require_relative 'data_access'
require_relative 'account_manager'
DAO = Data_access.new
data = DAO.data_file_to_hash
AM = Account_manager.new(data)
#AM.init_accounts(data)



