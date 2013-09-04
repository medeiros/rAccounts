class WebAccountsController < BaseController
  
  def initialize
    super(WebAccount)
  end
  
  def new
    super
    @entity.url ||= 'http://www'
  end

  def destroy_entity
    super
    redirect_to web_index_path      
  end
  
  private 
    def post_params
      params.require(:web_account).permit(:name, :url, :login, :password, :description)
    end
end
