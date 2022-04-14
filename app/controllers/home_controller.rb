class HomeController < ApplicationController
  before_action :authenticate_user!, only:[:whatsapp_api]
  

  def index
  end

  def sms_api
  end

  def two_way_sms
  end

  def contact
  end

  def pricing
  end

  def whatsapp_api
  end

  def get_api_doc
    send_file(
        "#{Rails.root}/app/assets/docs/RIVET_REST_API_DOC.pdf",
        type: "application/pdf",
        disposition: 'attachment', # 'inline' if you want to show PDF in the browser instead of downloading it directly
        x_sendfile: true
        )
  end
end
