require_relative 'ui_manager'
require_relative 'data_access'
require_relative 'account_manager'


Accountant.instance.init_class(DAO.instance.data_file_to_hash)
Interface.instance.what_to_do